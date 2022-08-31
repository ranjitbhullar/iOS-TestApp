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
    
    func testRepositoryWithFriendDetails_Success() {
        let expecatation = expectation(description: "Success")
        
        mockDataStore = MockFriendsDataStore(friend: MockFriendDetailData.friend)
        friendsRepository = FriendsRepository(dataStore: mockDataStore!)
 
        guard let friendsRepository = friendsRepository else { return }
        friendsRepository.getFriendWith(friendId: "123")
            .done { friend in
                XCTAssertEqual(friend.friendId, "123")
                XCTAssertEqual(friend.username, "Test User")
                expecatation.fulfill()
            }
            .catch { _ in
                XCTFail("Failed to fetch friend details")
            }

        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testRepositoryWithFriendDetail_Failure() {
        let expecatation = expectation(description: "Failure")
        
        mockDataStore = MockFriendsDataStore(error: NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage]))
        friendsRepository = FriendsRepository(dataStore: mockDataStore!)

        guard let friendsRepository = friendsRepository else { return }
        friendsRepository.getFriendWith(friendId: "123")
            .catch {error in
                XCTAssertTrue(error.localizedDescription ==   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testRepositoryFriendsList_Success() {
        let expecatation = expectation(description: "Success")
        
        mockDataStore = MockFriendsDataStore(friends: MockFriendsData.friends)
        friendsRepository = FriendsRepository(dataStore: mockDataStore!)
       
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
        
        mockDataStore = MockFriendsDataStore(error: NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage]))
        friendsRepository = FriendsRepository(dataStore: mockDataStore!)
        
        guard let friendsRepository = friendsRepository else { return }
        friendsRepository.getFriends()
            .catch {error in
                XCTAssertTrue(error.localizedDescription ==   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
