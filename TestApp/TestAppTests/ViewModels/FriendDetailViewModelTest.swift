//
//  MockDetailViewModelTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
import Combine

@testable import TestApp

class FriendDetailViewModelTest: XCTestCase  {

    var detailViewModel: FriendsDetailViewModel?
    var useCase = MockFriendDetailUseCase()
    var friend = MockFriendDetailPresentationData.friend
    var expectation: XCTestExpectation!
    private var cancelables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        detailViewModel = FriendsDetailViewModel(friendId: "123", useCase: useCase)
    }

    override func tearDownWithError() throws {
        detailViewModel = nil
    }
    
    func testViewModel_FriendDetailsSuccess() {
        expectation = expectation(description: "Success case")
        useCase.friend = MockFriendDetailDomainModel.friend
        detailViewModel?.fetchFriendDetails()
        detailViewModel!
               .$friend
               .filter { ($0 != nil) }
               .sink { value in
                   XCTAssertEqual(value?.friendId, "123")
                   self.expectation.fulfill()

               }
               .store(in: &cancelables)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testViewModel_FriendDetailsFailure() {
        expectation = expectation(description: "Failure")
        useCase.error = NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed Error"])
        detailViewModel?.fetchFriendDetails()
        sleep(1)
        detailViewModel!
               .$errorMessage
               .filter { ($0 != nil) }
               .sink { value in
                   
                   XCTAssertEqual(value, "Failed Error")
                   self.expectation.fulfill()

               }
               .store(in: &cancelables)
       
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testCheckSafariVCLoadTest_Success() {

        expectation = expectation(description: "This is failure case")
        detailViewModel?.friend = MockFriendDetailPresentationData.friend
        detailViewModel?.validateUrl()
        
        detailViewModel!
               .$validUrl
               .filter { $0 }
               .sink { value in
                  
                   self.expectation.fulfill()

               }
               .store(in: &cancelables)
        
        wait(for: [expectation], timeout: 1.0)
    }

    func testCheckSafariVCLoadTest_Failure() {

        expectation = expectation(description: "This is failure case")
        friend.htmlUrl = ""
        detailViewModel?.friendId = "123"
        detailViewModel?.validateUrl()
        
        detailViewModel!
               .$validUrl
               .filter { !$0 }
               .sink { value in
                   self.expectation.fulfill()
               }
               .store(in: &cancelables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}


