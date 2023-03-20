//
//  TestScoreView.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import SwiftUI

struct TestScoreView: View {
    @ObservedObject var masterViewModel: MasterViewModel
    @ObservedObject var testScoresViewModel: TestScoresViewModel
    
    var body: some View {
        VStack(spacing: 0.0) {
            topBar()
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: 14.0)
                    testScoresCell()
                    overviewCell()
                    Spacer()
                        .frame(height: 14.0)
                }
                
            }
        }
        //We cannot use the navigationbar because ItemBox retains
        //the view model, which leaks the view model
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func topBar() -> some View {
        VStack(spacing: 0.0) {
            HStack {
                ZStack {
                    Button {
                        masterViewModel.navigateBack()
                    } label: {
                        Image(systemName: "arrow.left.circle")
                            .font(.system(size: 36))
                            .foregroundColor(Color(red: 0.125, green: 0.125, blue: 0.165))
                    }
                }
                .frame(width: 44, height: 44)
                .padding(.leading, 10.0)
                .padding(.vertical, 4.0)
                
                HStack {
                    Text(masterViewModel.schoolFormatter.name(school: school))
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(red: 0.125, green: 0.125, blue: 0.165))
                }
                .padding(.trailing, 14.0)
                .padding(.vertical, 8.0)
                Spacer()
            }
            HStack {
                Spacer()
            }
            .frame(height: 1.0)
            .background(Color(red: 0.125, green: 0.125, blue: 0.165))
        }
    }
    
    func testScoresCell() -> some View {
        VStack {
            VStack {
                VStack(spacing: 0.0) {
                    HStack {
                        HStack {
                            Text("SAT Test Results")
                                .font(.callout.bold())
                            Spacer()
                        }
                        .padding(.leading, 4.0)
                        Spacer()
                    }
                    .padding(.horizontal, 6.0)
                    .foregroundColor(Color(red: 0.975, green: 0.945, blue: 1.0))
                    
                    VStack(spacing: 0.0) {
                        HStack {
                            Text("Test Takers: ")
                                .font(.callout.bold())
                                .fixedSize(horizontal: false, vertical: true)
                            Text(masterViewModel.testScoreFormatter.takers(testScore: testScore))
                                .font(.callout)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        .padding(.horizontal, 6.0)
                        .padding(.top, 6.0)
                        
                        HStack {
                            Text("Reading Average: ")
                                .font(.callout.bold())
                                .fixedSize(horizontal: false, vertical: true)
                            Text(masterViewModel.testScoreFormatter.reading(testScore: testScore))
                                .font(.callout)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        .padding(.horizontal, 6.0)
                        .padding(.top, 6.0)
                        
                        HStack {
                            Text("Writing Average: ")
                                .font(.callout.bold())
                                .fixedSize(horizontal: false, vertical: true)
                            Text(masterViewModel.testScoreFormatter.writing(testScore: testScore))
                                .font(.callout)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        .padding(.horizontal, 6.0)
                        .padding(.top, 6.0)
                        
                        HStack {
                            Text("Math Average: ")
                                .font(.callout.bold())
                                .fixedSize(horizontal: false, vertical: true)
                            Text(masterViewModel.testScoreFormatter.math(testScore: testScore))
                                .font(.callout)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        .padding(.all, 6.0)
                    }
                    .foregroundColor(Color(red: 0.125, green: 0.125, blue: 0.165))
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
    }
    
    func overviewCell() -> some View {
        VStack {
            VStack {
                VStack(spacing: 0.0) {
                    HStack {
                        if let url = URL(string: masterViewModel.schoolFormatter.websiteURL(school: school)) {
                            HStack {
                                Text("Website: ")
                                    .font(.callout.bold())
                                Link(destination: url, label: {
                                    Text(url.absoluteString)
                                        .font(.callout)
                                        .underline()
                                        .multilineTextAlignment(.leading)
                                })
                                Spacer()
                            }
                            .padding(.leading, 4.0)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 6.0)
                    .foregroundColor(Color(red: 0.975, green: 0.945, blue: 1.0))
                    
                    HStack {
                        if let url = URL(string: masterViewModel.schoolFormatter.phoneURL(school: school)) {
                            HStack {
                                Text("Phone: ")
                                    .font(.callout.bold())
                                Link(destination: url, label: {
                                    Text(masterViewModel.schoolFormatter.phone(school: school))
                                        .font(.callout)
                                        .underline()
                                })
                                Spacer()
                            }
                            .padding(.leading, 4.0)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 6.0)
                    .foregroundColor(Color(red: 0.975, green: 0.945, blue: 1.0))
                    
                    VStack {
                        HStack {
                            Text(masterViewModel.schoolFormatter.overview(school: school))
                                .font(.callout)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        .padding(.all, 6.0)
                    }
                    .foregroundColor(Color(red: 0.125, green: 0.125, blue: 0.165))
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
    }
    
    private var school: NYCSchool { testScoresViewModel.school }
    private var testScore: NYCTestScore { testScoresViewModel.testScore }
    
}

struct TestScoreView_Previews: PreviewProvider {
    static var previews: some View {
        TestScoreView(masterViewModel: .init(networkController: NetworkController()),
                      testScoresViewModel: .init(masterViewModel: .init(networkController: NetworkController()),
                                                 school: NYCSchool.mock(),
                                                 testScore: NYCTestScore.mock()))
    }
}
