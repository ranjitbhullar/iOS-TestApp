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
        let domainModelList: [FriendsListDomainModel] = mapper!.transform(data: MockFriendsData.friends)
        XCTAssertNotNil(domainModelList, "Failed to map domain model")
        XCTAssertGreaterThanOrEqual(domainModelList.count, 1, "Failed to map domain model")
        expectation.fulfill()
        
        wait(for: [expectation], timeout: 1.0)
    }
}
