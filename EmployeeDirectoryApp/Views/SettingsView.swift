//
//  SettingsView.swift
//  EmployeeDirectoryApp
//
//  Created by Tanveer Ansari on 2024-12-06.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        VStack(spacing: 20) {
            // Profile Image Section
            VStack {
                Image("MyProfileImage") // Ensure this image is added to your asset catalog
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                    .shadow(radius: 5)
                
                Text("Tanveer Ansari")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue) // New text color
                
                Text("Mobile Application Developer")
                    .font(.body)
                    .foregroundColor(Color.gray) // More subtle text color
            }
            .padding(.top, 20)

            Divider()

            // App Info Section
            VStack(alignment: .leading, spacing: 15) {
                Text("App Info")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.secondary)
                    .padding(.vertical, 5)
                
                Label("Name: Tanveer Ansari", systemImage: "person.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Label("Student ID: 1216609", systemImage: "number.square.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Label("Email: tanveer8403@outlook.com", systemImage: "envelope.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            Divider()

            Spacer()

            // Reset Onboarding Button
            Button(action: {
                hasSeenOnboarding = false
            }) {
                Text("Reset Onboarding")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue) // Updated button color
                    .cornerRadius(10)
                    .shadow(radius: 3)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline) // Make title less prominent
        .background(Color.white.edgesIgnoringSafeArea(.all)) // Fresh background color
    }
}
