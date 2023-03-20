//
//  _0230320_FelipeGomezMontoya_NYCSchoolsApp.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import SwiftUI

class ApplicationController {
    let networkController = NetworkController()
    lazy var masterViewModel: MasterViewModel = {
        MasterViewModel(networkController: networkController)
    }()
    
    lazy var schoolsViewModel: SchoolsViewModel = {
        SchoolsViewModel(masterViewModel: masterViewModel)
    }()
}

@main
struct _0230320_FelipeGomezMontoya_NYCSchoolsApp: App {
    let applicationController = ApplicationController()
    var body: some Scene {
        WindowGroup {
            NavigationRootView(masterViewModel: applicationController.masterViewModel,
                               schoolsViewModel: applicationController.schoolsViewModel)
        }
    }
}
