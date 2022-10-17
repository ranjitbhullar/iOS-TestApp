//
//  FriendsRepositoryTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class FriendsDataStoreTest: XCTestCase {

    var friendsDataStore: FriendsDataStore?
    var mockService: MockFriendsService?
    var mockCacheManager: MockCacheManager?
    let friends = MockFriendsData.friends

    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }

    func testDataStore_WithService() {
        let expecatation = expectation(description: "Success")
        mockService = MockFriendsService(friends: friends)
        mockCacheManager = MockCacheManager()
        friendsDataStore = FriendsDataStore(service: mockService!, cacheManager: mockCacheManager!)

        guard let friendsDataStore = friendsDataStore else { return }
        friendsDataStore.fetchFriendsData()
            .done { friends in
                XCTAssertGreaterThanOrEqual(friends.count, 1)
                expecatation.fulfill()
            }
            .catch { _ in
                XCTFail("Failed to fetch friends data from network")
            }

        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testDataStore_WithCache() {
        let expecatation = expectation(description: "Success")
        mockService = MockFriendsService(friends: friends)
        mockCacheManager = MockCacheManager(friends: friends)
        friendsDataStore = FriendsDataStore(service: mockService!, cacheManager: mockCacheManager!)
        
        guard let friendsDataStore = friendsDataStore else { return }
        friendsDataStore.fetchFriendsData()
            .done { friends in
                XCTAssertGreaterThanOrEqual(friends.count, 1)
                expecatation.fulfill()
            }
            .catch { _ in
                XCTFail("Failed to fetch friends data from cache")
            }

        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testDataStore_WithFriendId() {
        let expecatation = expectation(description: "Success")
        
        mockService = MockFriendsService(friends: MockFriendsData.friends)
        mockCacheManager = MockCacheManager(friends: MockFriendsData.friends)
        friendsDataStore = FriendsDataStore(service: mockService!, cacheManager: mockCacheManager!)
        
        guard let friendsDataStore = friendsDataStore else { return }
        friendsDataStore.fetchFriendWith(friendId:"123")
            .done { friend in
                XCTAssertEqual(friend.id, 123)
                XCTAssertEqual(friend.username, "Test User name")
               expecatation.fulfill()
            }
            .catch { _ in
                XCTFail("Failed to fetch friend details")
            }

        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testDataStoreWithFriendId_Failure() {
        let expecatation = expectation(description: "Failure")
        
        mockService = MockFriendsService(error: NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   TestConstants.ErrorConstants.kRepositoryFailedErrorMessage]))
        mockCacheManager = MockCacheManager()
        friendsDataStore = FriendsDataStore(service: mockService!, cacheManager: mockCacheManager!)
        
        guard let friendsDataStore = friendsDataStore else { return }
        friendsDataStore.fetchFriendWith(friendId: "123")
            .catch {error in
                XCTAssertEqual(error.localizedDescription,  TestConstants.ErrorConstants.kRepositoryFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
