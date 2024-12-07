//
//  Employee.swift
//  EmployeeDirectoryApp
//
//  Created by Tanveer Ansari on 2024-12-05.
//

import Foundation

enum EmployeeType: String, Codable {
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
    case contractor = "CONTRACTOR"
    
    var displayValue: String {
        switch self {
        case .fullTime: return "Full Time"
        case .partTime: return "Part Time"
        case .contractor: return "Contractor"
        }
    }
}

struct Employee: Codable, Identifiable {
    let id: String
    let fullName: String
    let phoneNumber: String
    let emailAddress: String
    let biography: String
    let photoUrl: String
    let team: String
    let employeeType: EmployeeType

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography
        case photoUrl = "photo_url_large"
        case team
        case employeeType = "employee_type"
    }
}

struct EmployeesResponse: Codable {
    let employees: [Employee]?
}


