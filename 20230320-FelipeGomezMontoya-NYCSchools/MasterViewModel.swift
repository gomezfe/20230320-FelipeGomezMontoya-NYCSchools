//
//  MasterViewModel.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import Foundation
import SwiftUI

class MasterViewModel: ObservableObject {
    
    @Published var path = NavigationPath()
    
    let networkController: NetworkControllerRepresenting
    
    init(networkController: NetworkControllerRepresenting) {
        self.networkController = networkController
    }
    
    let schoolFormatter = SchoolFormatter()
    let testScoreFormatter = TestScoreFormatter()
    
    func navigateBack() {
        path.removeLast()
    }
}
