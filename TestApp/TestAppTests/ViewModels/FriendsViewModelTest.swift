//
//  FriendsViewModelTest.swift
//  TechTest
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class FriendsListViewModelTest: XCTestCase {

    var friendsViewModel: FriendsViewModel?
    var useCase = MockFriendsUseCase()
    var expecatation: XCTestExpectation!

    override func setUpWithError() throws {
        friendsViewModel = FriendsViewModel(useCase: useCase)
        bindData()
    }
    
    override func tearDownWithError() throws {
        friendsViewModel = nil
    }

    func testViewModel_Success() {
        expecatation = expectation(description: "Success")
        useCase.friend = MockFriendsDomainModel.friends
        friendsViewModel?.fetchFriends()
        wait(for: [expecatation], timeout: 1.0)
    }

    func testViewModel_Fail() {
        expecatation = expectation(description: "Should get fail")
        useCase.error = NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed Error"])
        friendsViewModel?.fetchFriends()
        wait(for: [expecatation], timeout: 1.0)
    }
    
    ///Function to bind  UI with ViewModel properties
    private func bindData() {
        ///To bind fetch friends success view model response with ViewController
        friendsViewModel!.dataFetched.bind { [weak self] in
            if $0 {
                self?.expecatation.fulfill()
            }
        }
        
        ///To bind fetch friends error  view model response with ViewController
        friendsViewModel!.errorMessage.bind { [weak self] in
            
            guard let _ = $0 else { return }
            self?.expecatation.fulfill()
        }
    }
}
