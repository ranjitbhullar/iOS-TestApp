//
//  DetailUseCaseTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class FriendDetailUseCaseTest: XCTestCase  {
    
    var expectation: XCTestExpectation!
    let friend = MockFriendDetailDomainModel.friend
    var useCase: FriendsDetailUseCase?
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        
    }
    
    
    func testUsecase_FriendDetails() {
        expectation = expectation(description: "Success case")
        
        let repository = MockFriendsRepository(friend: friend)
        useCase = FriendsDetailUseCase(repository: repository)
        
        useCase?.getFriendDetailWith(friendId: friend!.friendId)
            .done { friend in
                XCTAssertEqual(friend.friendId, "123")
                self.expectation.fulfill()
            }
            .catch { error in
                XCTFail("Failed to get friend details")
            }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testDetailUsecase_Success() {
        expectation = expectation(description: "Success case")
        useCase = FriendsDetailUseCase(repository: MockFriendsRepository())
        
        useCase?.validateURL(for: friend?.htmlUrl ?? "") { result in
            XCTAssertEqual(result, true)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testDetailUsecase_Failure() {
        expectation = expectation(description: "This is failure case")
        useCase = FriendsDetailUseCase(repository: MockFriendsRepository())
        useCase?.validateURL(for: "") { result in
            XCTAssertEqual(result, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
