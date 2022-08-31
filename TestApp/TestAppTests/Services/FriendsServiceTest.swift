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
    var mockNetworkManager: MockFriendsNetworkManager?

    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }

    func testService_Success() {
        let expecatation = expectation(description: "Success")
        mockNetworkManager = MockFriendsNetworkManager(friends: MockFriendsData.friends)
        friendsService = FriendsService(network: mockNetworkManager!)
        
        guard let friendsService = friendsService else { return }
        friendsService.makeNetworkRequest()
            .done { friends in
                XCTAssertGreaterThanOrEqual(friends.count, 1)
                expecatation.fulfill()
            }
            .catch { _ in
                XCTFail("Failed to get friends data")
            }
        wait(for: [expecatation], timeout: 1.0)
    }

    func testService_Error() {
        let expecatation = expectation(description: "Friends service on success case")
        
        mockNetworkManager = MockFriendsNetworkManager(error: NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey:  AppConstants.ErrorConstants.kServiceFailedErrorMeesage]))
        friendsService = FriendsService(network: mockNetworkManager!)
        
        guard let friendsService = friendsService else { return }
        friendsService.makeNetworkRequest()
            .catch {error in
                XCTAssertEqual(error.localizedDescription, AppConstants.ErrorConstants.kServiceFailedErrorMeesage)
                expecatation.fulfill()
            }
        wait(for: [expecatation], timeout: 1.0)
    }
}
