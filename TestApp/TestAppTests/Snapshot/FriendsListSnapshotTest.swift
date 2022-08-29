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

class FriendsListSnapshotTest: XCTestCase {
    
    var listViewModel: FriendsListViewModel?
    var useCase = MockFriendsListUseCase()

    override func setUpWithError() throws {
        listViewModel = FriendsListViewModel(useCase: useCase)
        setupFriendsListViewModelData()
    }
    
    func setupFriendsListViewModelData()
    {
        listViewModel?.friends = [
            FriendsListRowViewModel(friendId: "123", nickname: "Test Friend1", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4"),
            FriendsListRowViewModel(friendId: "123", nickname: "Test Friend2", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4"),
            FriendsListRowViewModel(friendId: "123", nickname: "Test Friend3", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4")]
    }
    
    override func tearDownWithError() throws {
       
    }

    func testFriendsList() {
        
        let friendsListView: FriendsListView = FriendsListView(viewModel: listViewModel!)
//        isRecording = true
        assertSnapshot(matching: friendsListView.toViewController(), as: .image)
    }
}

extension SwiftUI.View {
    
    func toViewController() -> UIViewController {
        let viewController = UIHostingController(rootView: self)
        viewController.view.frame = UIScreen.main.bounds
        return viewController
    }
}
