//
//  NavigationRootView.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import SwiftUI

struct NavigationRootView: View {
    
    @ObservedObject var masterViewModel: MasterViewModel
    @ObservedObject var schoolsViewModel: SchoolsViewModel
    
    var body: some View {
        NavigationStack(path: $masterViewModel.path) {
            SchoolsView(masterViewModel: masterViewModel,
                        schoolsViewModel: schoolsViewModel)
            .navigationDestination(for: TestScoresViewModel.self) { testScoresViewModel in
                TestScoreView(masterViewModel: masterViewModel,
                              testScoresViewModel: testScoresViewModel)
            }
        }
    }
}

struct NavigationRootView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationRootView(masterViewModel: .init(networkController: NetworkController()),
                           schoolsViewModel: .init(masterViewModel: .init(networkController: NetworkController())))
    }
}
