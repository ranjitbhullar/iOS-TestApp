//
//  DomainToPresentationMapper.swift
//  TestAppTests
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class DomainToPresentationMapperTest: XCTestCase  {
    
    var mapper: FriendPresentationModelMapper?
    var expectation: XCTestExpectation!

    override func setUpWithError() throws {
        mapper = FriendPresentationModelMapper(domainModel: MockFriendDetailDomainModel.friend!)
    }

    override func tearDownWithError() throws {
        mapper = nil
    }
    
    func testDataToDomainMapper() {
        expectation = expectation(description: "Success case")
        let presentationModel = mapper?.mapToPresentationModel()
        if (presentationModel != nil) {
            expectation.fulfill()
        }
        else {
            XCTFail("Failed to map domain model")
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
