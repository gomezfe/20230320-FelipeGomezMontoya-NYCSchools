//
//  TestScoreFormatter.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import Foundation

struct TestScoreFormatter {
    func reading(testScore: NYCTestScore) -> String {
        testScore.satCriticalReadingAvgScore ?? ""
    }
    
    func writing(testScore: NYCTestScore) -> String {
        testScore.satWritingAvgScore ?? ""
    }
    
    func math(testScore: NYCTestScore) -> String {
        testScore.satMathAvgScore ?? ""
    }
    
    func takers(testScore: NYCTestScore) -> String {
        testScore.numOfSatTestTakers ?? ""
    }
}
