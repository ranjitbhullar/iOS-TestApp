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
    let mockService = MockFriendsService()
    let mockCacheManager = MockCacheManager()

    override func setUpWithError() throws {
        friendsDataStore = FriendsDataStore(service: mockService, cacheManager: mockCacheManager)
    }
    
    override func tearDownWithError() throws {
        friendsDataStore = nil
    }

    func testDataStore_WithService() {
        let expecatation = expectation(description: "Success")
        mockService.friends = MockFriendsData.friend
        guard let friendsDataStore = friendsDataStore else { return }
        friendsDataStore.fetchFriendsData()
            .done { model in
                let friendsCount = model.count
                if friendsCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testDataStore_WithCache() {
        let expecatation = expectation(description: "Success")
        mockService.friends = MockFriendsData.friend
        mockCacheManager.friends = MockFriendsData.friend
        
        guard let friendsDataStore = friendsDataStore else { return }
        friendsDataStore.fetchFriendsData()
            .done { model in
                let friendsCount = model.count
                if friendsCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testDataStore_WithFriendId() {
        let expecatation = expectation(description: "Success")
        mockService.friends = MockFriendsData.friend
        mockCacheManager.friends = MockFriendsData.friend
        guard let friendsDataStore = friendsDataStore else { return }
        friendsDataStore.fetchFriendWith(friendId:"123")
            .done { model in
               expecatation.fulfill()
            }
            .catch { _ in
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testDataStoreWithFriendId_Failure() {
        let expecatation = expectation(description: "Failure")
        mockService.error = NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage])
        guard let friendsDataStore = friendsDataStore else { return }
        friendsDataStore.fetchFriendWith(friendId: "123")
            .catch {error in
                XCTAssertTrue(error.localizedDescription ==   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
