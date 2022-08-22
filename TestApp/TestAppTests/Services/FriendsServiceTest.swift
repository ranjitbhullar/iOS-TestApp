//
//  FriendsServiceTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class FriendsServiceTest: XCTestCase {

    var friendsService: FriendsService?
    let mockNetworkManager = MockFriendsNetworkManager()

    override func setUpWithError() throws {
        friendsService = FriendsService(network: mockNetworkManager)
    }
    
    override func tearDownWithError() throws {
        friendsService = nil
    }

    func testService_Success() {
        let expecatation = expectation(description: "Success")
        mockNetworkManager.friends = MockFriendsData.friend
        guard let friendsService = friendsService else { return }
        friendsService.makeNetworkRequest()
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

    func testService_Error() {
        let expecatation = expectation(description: "Friends service on success case")
        mockNetworkManager.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey:  AppConstants.ErrorConstants.kServiceFailedErrorMeesage])
        guard let friendsService = friendsService else { return }
        friendsService.makeNetworkRequest()
            .catch { _ in
                expecatation.fulfill()
            }
        wait(for: [expecatation], timeout: 1.0)
    }
}
