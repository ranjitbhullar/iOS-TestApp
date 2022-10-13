//
//  DetailUseCaseTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class DataToDomainMapperTest: XCTestCase  {
    
    var mapper: FriendsDataToDomainMapper?
    var expectation: XCTestExpectation!

    override func setUpWithError() throws {
        mapper = FriendsDataToDomainMapper()
    }

    override func tearDownWithError() throws {
        mapper = nil
    }
    
    func testDataToDomainMapper() {
        expectation = expectation(description: "Success case")
        let domainModel = mapper?.transform(data: MockFriendsData.friends ?? [])
        if (domainModel != nil) {
            expectation.fulfill()
        }
        else {
            XCTFail("Failed to map domain model")
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
