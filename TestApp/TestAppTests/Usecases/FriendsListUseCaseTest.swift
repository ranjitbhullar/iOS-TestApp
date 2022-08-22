//
//  FriendsUseCaseTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class FriendsListUseCaseTest: XCTestCase {

    var useCase: FriendsListUseCase?
    let repository = MockFriendsRepository()

    override func setUpWithError() throws {
        useCase = FriendsListUseCase(repository: repository)
    }
    
    override func tearDownWithError() throws {
        useCase = nil
    }

    func testUseCase_Success() {
        let expecatation = expectation(description: "Success")

        repository.friends = MockFriendsDomainModel.friends
        guard let useCase = useCase else { return }
        useCase.getFriends()
            .done { model in
                let friendsCount = model.count
                if friendsCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testUseCase_Failure() {
        let expecatation = expectation(description: "Failure")
        repository.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   AppConstants.ErrorConstants.kUseCaseFailedErrorMessage])
        guard let useCase = useCase else { return }
        useCase.getFriends()
            .catch { error in
                XCTAssertTrue(error.localizedDescription ==   AppConstants.ErrorConstants.kUseCaseFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
