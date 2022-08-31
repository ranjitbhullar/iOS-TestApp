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

    var detailViewModel: FriendDetailViewModel?
    var useCase: MockFriendDetailUseCase?
    var expectation: XCTestExpectation!
    private var cancelables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        detailViewModel = nil
    }
    
    func testViewModel_FriendDetailsSuccess() {
        expectation = expectation(description: "Success case")
        useCase = MockFriendDetailUseCase(friend: MockFriendDetailDomainModel.friend)
        detailViewModel = FriendDetailViewModel(friendId: "123", useCase: useCase!)

        detailViewModel?.fetchFriendDetails()
        detailViewModel!
               .$username
               .filter { ($0 != nil) }
               .sink { value in
                   
                   XCTAssertEqual(value, "Test User name")
                   self.expectation.fulfill()

               }
               .store(in: &cancelables)
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testViewModel_FriendDetailsFailure() {
        expectation = expectation(description: "Failure")
        
        useCase = MockFriendDetailUseCase(error: NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed Error"]))
        detailViewModel = FriendDetailViewModel(friendId: "123", useCase: useCase!)
        
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
        
        useCase = MockFriendDetailUseCase(friend: MockFriendDetailDomainModel.friend)
        detailViewModel = FriendDetailViewModel(friendId: "123", useCase: useCase!)
        detailViewModel?.htmlUrl = "https://www.linkedin.com/in/joshuapeek30354/"
        
        detailViewModel?.validateUrl()
        
        detailViewModel!
               .$validUrl
               .filter { $0 }
               .sink { value in
                   XCTAssertEqual(value, true)
                   self.expectation.fulfill()

               }
               .store(in: &cancelables)
        
        wait(for: [expectation], timeout: 1.0)
    }

    func testCheckSafariVCLoadTest_Failure() {

        expectation = expectation(description: "This is failure case")
        
        useCase = MockFriendDetailUseCase(friend: MockFriendDetailDomainModel.friend)
        detailViewModel = FriendDetailViewModel(friendId: "123", useCase: useCase!)
        
        detailViewModel?.validateUrl()
        
        detailViewModel!
               .$validUrl
               .filter { !$0 }
               .sink { value in
                   XCTAssertEqual(value, false)
                   self.expectation.fulfill()
               }
               .store(in: &cancelables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}


