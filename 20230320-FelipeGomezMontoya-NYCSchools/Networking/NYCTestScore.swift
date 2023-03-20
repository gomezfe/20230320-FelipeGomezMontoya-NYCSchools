//
//  NYCTestScore.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import Foundation

struct NYCTestScore: Decodable {
    let dbn: String
    let numOfSatTestTakers: String?
    let satCriticalReadingAvgScore: String?
    let satWritingAvgScore: String?
    let satMathAvgScore: String?
    
    static func mock() -> NYCTestScore {
        NYCTestScore(dbn: "01M292",
                     numOfSatTestTakers: "29",
                     satCriticalReadingAvgScore: "355",
                     satWritingAvgScore: "363",
                     satMathAvgScore: "404")
    }
}
