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
    let mockDataStore = MockFriendsDataStore()

    override func setUpWithError() throws {
        friendsRepository = FriendsRepository(dataStore: mockDataStore)
    }
    
    override func tearDownWithError() throws {
        friendsRepository = nil
    }
    
    func testRepositoryWithFriendDetails_Success() {
        let expecatation = expectation(description: "Success")
        mockDataStore.friend = MockFriendDetailData.friend
        guard let friendsRepository = friendsRepository else { return }
        friendsRepository.getFriendWith(friendId: "123")
            .done { model in
                if !model.friendId.isEmpty {
                    expecatation.fulfill()
                }
                else {
                    XCTFail("Failure not expected in this case")
                }
            }
            .catch { _ in
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testRepositoryWithFriendDetail_Failure() {
        let expecatation = expectation(description: "Failure")
        mockDataStore.error = NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage])
        guard let friendsRepository = friendsRepository else { return }
        friendsRepository.getFriendWith(friendId: "123")
            .catch {error in
                XCTAssertTrue(error.localizedDescription ==   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testRepository_Success() {
        let expecatation = expectation(description: "Success")
        mockDataStore.friends = MockFriendsData.friend
        guard let friendsRepository = friendsRepository else { return }
        friendsRepository.getFriends()
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

    func testRepository_Failure() {
        let expecatation = expectation(description: "Failure")
        mockDataStore.error = NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage])
        guard let friendsRepository = friendsRepository else { return }
        friendsRepository.getFriends()
            .catch {error in
                XCTAssertTrue(error.localizedDescription ==   AppConstants.ErrorConstants.kRepositoryFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
