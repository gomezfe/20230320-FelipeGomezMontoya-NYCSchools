//
//  SchoolFormatter.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import Foundation

struct SchoolFormatter {
    
    func name(school: NYCSchool) -> String {
        return school.schoolName ?? ""
    }
    
    func overview(school: NYCSchool) -> String {
        return school.overviewParagraph ?? ""
    }
    
    func phone(school: NYCSchool) -> String {
        return school.phoneNumber ?? ""
    }
    
    func phoneURL(school: NYCSchool) -> String {
        if let phoneNumber = school.phoneNumber {
            let phoneNumberNumbers = phoneNumber.filter { $0.isNumber }
            let urlString = "tel://\(phoneNumberNumbers)"
            return urlString
        }
        return ""
    }
    
    func websiteURL(school: NYCSchool) -> String {
        if let website = school.website {
            return "https://\(website)"
        }
        return ""
    }
    
    func address(school: NYCSchool) -> String {
        
        if let street = school.primaryAddressLine1 {
            if let city = school.city, let state = school.stateCode, let zip = school.zip {
                return "\(street)\n\(city), \(state), \(zip)"
            } else {
                return street
            }
        } else {
            if let city = school.city, let state = school.stateCode, let zip = school.zip {
                return "\(city), \(state), \(zip)"
            } else {
                return ""
            }
        }
    }
}
