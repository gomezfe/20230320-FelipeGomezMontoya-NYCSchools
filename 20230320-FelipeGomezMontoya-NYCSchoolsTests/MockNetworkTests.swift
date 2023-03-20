//
//  MockNetworkTests.swift
//  20230320-FelipeGomezMontoya-NYCSchoolsTests
//
//  Created by Felipe Gomez on 3/20/23.
//

@testable import _0230320_FelipeGomezMontoya_NYCSchools
import Foundation
import XCTest

final class MockNetworkTests: XCTestCase {
    
    func testDownloadSchools() {
        let expectation = XCTestExpectation(description: "com.test.unit.mock.network.download.schools")
        let networkController = MockNetworkController()
        networkController.downloadSchools { result in
            switch result {
            case .success(let schools):
                guard schools.count > 0 else {
                    XCTFail("Did not download any schools.")
                    return
                }
                expectation.fulfill()
            case .failure(let error):
                print(error as NSError)
                XCTFail("Failed to download schools.")
            }
        }
        wait(for: [expectation], timeout: 12.0)
    }
    
    func testDownloadTestScores() {
        let expectation = XCTestExpectation(description: "com.test.unit.mock.network.download.schools")
        let networkController = MockNetworkController()
        networkController.downloadTestScores() { result in
            switch result {
            case .success(let testScores):
                guard testScores.count > 0 else {
                    XCTFail("Did not download any test scores.")
                    return
                }
                expectation.fulfill()
            case .failure(let error):
                print(error as NSError)
                XCTFail("Failed to download test scores.")
            }
        }
        wait(for: [expectation], timeout: 12.0)
    }
    
}
