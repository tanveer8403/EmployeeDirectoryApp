//
//  EmployeeListView.swift
//  EmployeeDirectoryApp
//
//  Created by Tanveer Ansari on 2024-12-06.
//

import SwiftUI

struct EmployeeListView: View {
    @StateObject private var viewModel = EmployeeViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    if viewModel.isLoading {
                        ProgressView()
                            .scaleEffect(1.5)
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.primary))
                            .padding()
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else if viewModel.employees.isEmpty {
                        Text("No employees found.")
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        ForEach(viewModel.filteredEmployees) { employee in
                            NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                                EmployeeCardView(employee: employee)
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Employees")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.fetchEmployees()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(Color.primary)
                    }
                }
            }
            .searchable(text: $viewModel.searchQuery, placement: .navigationBarDrawer(displayMode: .always))
            .refreshable {
                viewModel.fetchEmployees()
            }
            .onAppear {
                viewModel.fetchEmployees()
            }
        }
    }
}


struct EmployeeCardView: View {
    let employee: Employee
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: employee.photoUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .frame(width: 70, height: 70)
            .clipShape(Circle())
            .shadow(radius: 3)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(employee.fullName)
                    .font(.headline)
                    .foregroundColor(Color.primary)
                
                Text(employee.team)
                    .font(.subheadline)
                    .foregroundColor(Color.secondary)
                
                Label(employee.employeeType.displayValue, systemImage: "star.fill")
                    .font(.caption)
                    .foregroundColor(Color.orange)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(Color.orange.opacity(0.2))
                    .clipShape(Capsule())
            }
            Spacer()
        }
        .padding()
        .background(Color.white) // Consider a very subtle gradient here as well
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}
