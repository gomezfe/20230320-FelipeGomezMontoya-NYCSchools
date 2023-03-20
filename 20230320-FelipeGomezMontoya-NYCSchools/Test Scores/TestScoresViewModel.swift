//
//  TestScoresViewModel.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import Foundation
import UIKit

class TestScoresViewModel: ObservableObject {
    
    let masterViewModel: MasterViewModel
    let school: NYCSchool
    let testScore: NYCTestScore
    
    init(masterViewModel: MasterViewModel, school: NYCSchool, testScore: NYCTestScore) {
        self.masterViewModel = masterViewModel
        self.school = school
        self.testScore = testScore
        print("TestScoresViewModel init")
    }
    
    deinit {
        print("TestScoresViewModel deinit")
    }
    
    func makePhoneCall() {
        
        
    }
    
}

extension TestScoresViewModel: Hashable {
    static func == (lhs: TestScoresViewModel, rhs: TestScoresViewModel) -> Bool {
        lhs.school.dbn == rhs.school.dbn
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(school.dbn)
    }
}
