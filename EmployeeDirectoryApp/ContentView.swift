//
//  ContentView.swift
//  EmployeeDirectoryApp
//
//  Created by Tanveer Ansari on 2024-12-05.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            EmployeeListView()
                .tabItem {
                    Label("Employees", systemImage: "person.3")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
