//
//  EmployeeViewModel.swift
//  EmployeeDirectoryApp
//
//  Created by Tanveer Ansari on 2024-12-05.
//

import Foundation

class EmployeeViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var searchQuery: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let endpoint = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    
    func fetchEmployees() {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: endpoint) else {
            errorMessage = "Invalid URL."
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.errorMessage = "Network error: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    self.errorMessage = "No data received."
                    return
                }
                
                // Log raw JSON for debugging
                if let rawJSON = String(data: data, encoding: .utf8) {
                    print("Raw JSON: \(rawJSON)")
                }
                
                do {
                    let response = try JSONDecoder().decode(EmployeesResponse.self, from: data)
                    self.employees = response.employees ?? []
                } catch {
                    self.errorMessage = "Failed to parse data: \(error.localizedDescription)"
                    print("Decoding Error: \(error)")
                }
            }
        }.resume()
    }
    
    var filteredEmployees: [Employee] {
        if searchQuery.isEmpty {
            return employees
        } else {
            return employees.filter { $0.fullName.lowercased().contains(searchQuery.lowercased()) }
        }
    }
}

