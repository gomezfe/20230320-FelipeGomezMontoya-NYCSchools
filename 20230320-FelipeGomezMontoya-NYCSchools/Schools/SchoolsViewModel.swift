//
//  SchoolsViewModel.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import Foundation

class SchoolsViewModel: ObservableObject {
    
    @Published private(set) var schools = [NYCSchool]()
    @Published private(set) var refreshingSchools = false
    @Published var refreshingSchoolsError = false
    
    @Published private(set) var testScores = [NYCTestScore]()
    @Published private(set) var refreshingTestScores = false
    @Published var refreshingTestScoresError = false
    
    let masterViewModel: MasterViewModel
    let networkController: NetworkControllerRepresenting
    init(masterViewModel: MasterViewModel) {
        self.masterViewModel = masterViewModel
        self.networkController = masterViewModel.networkController
        refreshSchools() { }
        refreshTestScores() { }
    }
    
    func refreshSchools(completion: @escaping () -> Void) {
        refreshingSchools = true
        refreshingSchoolsError = false
        networkController.downloadSchools { result in
            switch result {
            case .success(let schools):
                self.schools = schools
            case .failure(let error):
                print("Error downloading schools!")
                print(error as NSError)
                self.schools = []
                self.refreshingSchoolsError = true
            }
            self.refreshingSchools = false
            completion()
        }
    }
    
    func refreshTestScores(completion: @escaping () -> Void) {
        refreshingTestScores = true
        refreshingTestScoresError = false
        networkController.downloadTestScores { result in
            switch result {
            case .success(let testScores):
                self.testScores = testScores
            case .failure(let error):
                print("Error downloading test scores!")
                print(error as NSError)
                self.testScores = []
                self.refreshingTestScoresError = true
            }
            self.refreshingTestScores = false
            completion()
        }
    }
    
    func select(school: NYCSchool) {
        
        for testScore in testScores {
            if testScore.dbn == school.dbn {
                selectedSchool(school: school,
                               testScore: testScore)
                return
            }
        }
        selectedSchoolNoScore(school: school)
    }
    
    private func selectedSchoolNoScore(school: NYCSchool) {
        refreshingTestScoresError = true
    }
    
    private func selectedSchool(school: NYCSchool, testScore: NYCTestScore) {
        let testScoresViewModel = TestScoresViewModel(masterViewModel: masterViewModel,
                                                      school: school,
                                                      testScore: testScore)
        masterViewModel.path.append(testScoresViewModel)
    }
    
}
