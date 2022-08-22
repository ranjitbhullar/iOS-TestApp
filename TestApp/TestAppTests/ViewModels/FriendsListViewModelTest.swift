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
    var useCase = MockFriendsListUseCase()
    var expecatation: XCTestExpectation!
    private var cancelables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        friendsViewModel = FriendsListViewModel(useCase: useCase)
    }
    
    override func tearDownWithError() throws {
        friendsViewModel = nil
    }

    func testViewModel_Success() {
         
        expecatation = expectation(description: "Success")
        useCase.friend = MockFriendsDomainModel.friends
        friendsViewModel?.fetchFriends()
        
        friendsViewModel!
               .$friends
               .filter { ($0.count > 0) }
               .sink { value in
                   XCTAssertEqual(value.count, 3)
                   self.expecatation.fulfill()

               }
               .store(in: &cancelables)
        
        wait(for: [expecatation], timeout: 1.0)
    }

    func testViewModel_Fail() {
        expecatation = expectation(description: "Failure")
        useCase.error = NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed Error"])
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
