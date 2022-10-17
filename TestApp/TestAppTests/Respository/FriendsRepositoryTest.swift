//
//  FriendsRepositoryTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class FriendsRepositoryTest: XCTestCase {

    var friendsRepository: FriendsRepository?
    var mockDataStore: MockFriendsDataStore?

    override func setUpWithError() throws {
    }
    
     override func tearDownWithError() throws {
    }

    func testRepositoryFriendsList_Success() {
        let expecatation = expectation(description: "Success")
        
        mockDataStore = MockFriendsDataStore(friends: MockFriendsData.friends)
        friendsRepository = FriendsRepository(dataStore: mockDataStore!, mapper: FriendsDataToDomainMapper())
       
        guard let friendsRepository = friendsRepository else { return }
        friendsRepository.getFriends()
            .done { friends in
                XCTAssertGreaterThanOrEqual(friends.count, 1)
                expecatation.fulfill()
            }
            .catch { _ in
                XCTFail("Failed to get friends data")
            }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testRepositoryFriendsList_Failure() {
        let expecatation = expectation(description: "Failure")
        
        mockDataStore = MockFriendsDataStore(error: NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   TestConstants.ErrorConstants.kRepositoryFailedErrorMessage]))
        friendsRepository = FriendsRepository(dataStore: mockDataStore!, mapper: FriendsDataToDomainMapper())
        
        guard let friendsRepository = friendsRepository else { return }
        friendsRepository.getFriends()
            .catch {error in
                XCTAssertTrue(error.localizedDescription ==   TestConstants.ErrorConstants.kRepositoryFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
