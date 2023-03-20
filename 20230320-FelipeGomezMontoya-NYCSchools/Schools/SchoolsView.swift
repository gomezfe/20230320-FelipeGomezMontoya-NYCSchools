//
//  SchoolsView.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import SwiftUI

struct SchoolsView: View {
    
    @ObservedObject var masterViewModel: MasterViewModel
    @ObservedObject var schoolsViewModel: SchoolsViewModel
    
    var body: some View {
        ZStack {
            VStack {
                List(schoolsViewModel.schools) { school in
                    Button {
                        schoolsViewModel.select(school: school)
                    } label: {
                        schoolCell(school: school)
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            
            if schoolsViewModel.refreshingSchools {
                LoadingView()
            }
        }
        .alert("Error downloading schools, please check your network and try again.", isPresented: $schoolsViewModel.refreshingSchoolsError) {
            Button("Okay") { }
        }
        .alert("Error downloading test scores, please check your network and try again.", isPresented: $schoolsViewModel.refreshingTestScoresError) {
            Button("Okay") { }
        }
    }
    
    func schoolCell(school: NYCSchool) -> some View {
        VStack {
            VStack {
                VStack(spacing: 0.0) {
                    HStack {
                        Text(masterViewModel.schoolFormatter.name(school: school))
                            .font(.title2)
                        Spacer()
                    }
                    .padding(.horizontal, 6.0)
                    .foregroundColor(Color(red: 0.975, green: 0.945, blue: 1.0))
                    
                    VStack {
                        HStack {
                            Text(masterViewModel.schoolFormatter.address(school: school))
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(Color(red: 0.125, green: 0.125, blue: 0.165))
                            Spacer()
                        }
                        .padding(.all, 6.0)
                    }
                    .background(RoundedRectangle(cornerRadius: 6.0, style: .continuous).stroke().foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62)))
                    .background(RoundedRectangle(cornerRadius: 6.0, style: .continuous).foregroundColor(Color(red: 0.875, green: 0.875, blue: 0.875)))
                    .padding(.all, 6.0)
                }
                .padding(.all, 6.0)
            }
            .background(RoundedRectangle(cornerRadius: 10.0, style: .continuous).stroke().foregroundColor(Color(red: 0.32, green: 0.42, blue: 0.62)))
            .background(RoundedRectangle(cornerRadius: 10.0, style: .continuous).foregroundColor(Color(red: 0.475, green: 0.575, blue: 0.875)))
        }
        .padding(.horizontal, 14.0)
        .padding(.bottom, 6.0)
    }
}

struct SchoolsView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolsView(masterViewModel: .init(networkController: NetworkController()),
                    schoolsViewModel: .init(masterViewModel: .init(networkController: NetworkController())))
    }
}
