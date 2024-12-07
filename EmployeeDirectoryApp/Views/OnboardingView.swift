//
//  OnboardingView.swift
//  EmployeeDirectoryApp
//
//  Created by Tanveer Ansari on 2024-12-06.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        VStack {
            // Title Section
            Spacer()
            
            Text("Employee Directory App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            // Logo Section
            ZStack {
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 150, height: 150)
                    .shadow(radius: 8)
                
                Text("LOGO")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding(.bottom, 20)
            
            // Description Section
            Text("""
            Discover and connect with colleagues through our Employee Directory App, designed for seamless navigation and updated in real-time. Search for employees by name to quickly access detailed profiles, including contact information and professional backgrounds. Each profile is a tap away, offering a user-friendly experience to enhance your workplace connections.
            """)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.white.opacity(0.9))
                .padding(.horizontal, 30)
            
            Spacer()
            
            // Continue Button
            Button(action: {
                hasSeenOnboarding = true
            }) {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(12)
                    .shadow(color: Color.green.opacity(0.4), radius: 6, x: 0, y: 3)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.6)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .ignoresSafeArea()
    }
}


