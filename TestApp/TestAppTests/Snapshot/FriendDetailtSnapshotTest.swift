//
//  FriendsSnapshotTest.swift
//  TestAppTests
//
//  Created by Ranjit Singh on 29/08/22.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import TestApp

class FriendDetailSnapshotTest: XCTestCase {
    
    var detailViewModel: FriendDetailViewModel?
    var useCase = MockFriendDetailUseCase()

    override func setUpWithError() throws {
        
        detailViewModel = FriendDetailViewModel(friendId: "123", useCase: useCase)
        setupFriendDetailViewModelData()
    }
    
    func setupFriendDetailViewModelData() {
        detailViewModel?.username = "Test Friend1"
        detailViewModel?.avatarUrl = "https://avatars.githubusercontent.com/u/137?v=4"
        detailViewModel?.htmlUrl = "https://avatars.githubusercontent.com/u/137?v=4"
    }
    
    override func tearDownWithError() throws {
       
    }

    func testFriendsDetails() {
        
        let friendDetailView: FriendDetailView = FriendDetailView(viewModel: detailViewModel!)
//        isRecording = true
        assertSnapshot(matching: friendDetailView.toViewController(), as: .image)
    }
}
