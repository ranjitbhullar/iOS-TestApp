//
//  DetailUseCaseTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class FriendDetailUseCaseTest: XCTestCase  {
    
    var useCase: FriendsDetailUseCase?
    var friend = MockFriendDetailDomainModel.friend
    let repository = MockFriendsRepository()
    
    var expectation: XCTestExpectation!

    override func setUpWithError() throws {
        useCase = FriendsDetailUseCase(repository: repository)
    }

    override func tearDownWithError() throws {
        useCase = nil
    }
    
    
    
    func testUsecase_FriendDetails() {
        expectation = expectation(description: "Success case")
        repository.friend = MockFriendDetailDomainModel.friend
        guard let useCase = useCase else { return }
        useCase.getFriendDetailWith(friendId: friend!.friendId)
            .done { friend in
                if friend.friendId == "123" {
                    self.expectation.fulfill()
                }
            }
            .catch { error in
                print(error)
            }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testDetailUsecase_Success() {
        expectation = expectation(description: "Success case")
        useCase?.validateURL(for: friend?.htmlUrl ?? "") { result in
            if result {
                expectation.fulfill()
            }
            else {
                
                XCTFail("Failure not expected in this case")
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testDetailUsecase_Failure() {
        expectation = expectation(description: "This is failure case")
        useCase?.validateURL(for: "") { result in
            if result {
                XCTFail("Success is not expected in this case")
            } else {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
