//
//  FriendsViewModelTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
import Combine

@testable import TestApp

class FriendsListViewModelTest: XCTestCase {
    
    var friendsViewModel: FriendsListViewModel?
    var useCase: MockFriendsListUseCase?
    var expecatation: XCTestExpectation!
    private var cancelables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }

    func testViewModel_Success() {
         
        expecatation = expectation(description: "Success")
        useCase = MockFriendsListUseCase(friend: MockFriendsDomainModel.friends)
        friendsViewModel = FriendsListViewModel(useCase: useCase!)
        friendsViewModel?.fetchFriends()
        
        friendsViewModel!
               .$friends
               .filter { ($0.count > 0) }
               .sink { value in
                   XCTAssertGreaterThanOrEqual(value.count, 1)
                   self.expecatation.fulfill()

               }
               .store(in: &cancelables)
        
        wait(for: [expecatation], timeout: 1.0)
    }

    func testViewModel_Fail() {
        expecatation = expectation(description: "Failure")
        useCase = MockFriendsListUseCase(error:  NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed Error"]))
        friendsViewModel = FriendsListViewModel(useCase: useCase!)
        friendsViewModel?.fetchFriends()
        
        friendsViewModel!
               .$errorMessage
               .filter { ($0 != nil) }
               .sink { value in
                   XCTAssertEqual(value, "Failed Error")
                   self.expecatation.fulfill()

               }
               .store(in: &cancelables)
        
        wait(for: [expecatation], timeout: 1.0)
    }
}
