//
//  FriendsUseCaseTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class FriendsListUseCaseTest: XCTestCase {
    
    var expectation: XCTestExpectation!
    var useCase: FriendsListUseCase?
    var repository: MockFriendsRepository?
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }

    func testUseCase_Success() {
        expectation = expectation(description: "Success")
        repository = MockFriendsRepository(friends: MockFriendsDomainModel.friends)
        useCase = FriendsListUseCase(repository: repository!)
        
        useCase?.getFriends()
            .done { friends in
                XCTAssertGreaterThanOrEqual(friends.count, 1)
                self.expectation.fulfill()
            }
            .catch { _ in
                XCTFail("Failed to get friends")
            }

        wait(for: [expectation], timeout: 1.0)
    }

    func testUseCase_Failure() {
        expectation = expectation(description: "Failure")
        
        repository = MockFriendsRepository(error: NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   AppConstants.ErrorConstants.kUseCaseFailedErrorMessage]))
        useCase = FriendsListUseCase(repository: repository!)
        useCase?.getFriends()
            .catch { error in
                XCTAssertTrue(error.localizedDescription ==   AppConstants.ErrorConstants.kUseCaseFailedErrorMessage)
                self.expectation.fulfill()
            }

        wait(for: [expectation], timeout: 1.0)
    }
}
