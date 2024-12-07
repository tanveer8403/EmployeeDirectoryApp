//
//  EmployeeDirectoryAppApp.swift
//  EmployeeDirectoryApp
//
//  Created by Tanveer Ansari on 2024-12-05.
//

import SwiftUI

@main
struct EmployeeExplorerApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                MainView()
            } else {
                OnboardingView()
            }
        }
    }
}
