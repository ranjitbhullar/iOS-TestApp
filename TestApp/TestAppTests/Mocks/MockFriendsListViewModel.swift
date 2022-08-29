//
//  MockFriendsUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit
@testable import TestApp

class MockFriendsListViewModel: FriendsListViewModelProtocol {
    var friends: [FriendsListRowViewModel] = []
    var errorMessage: String?

    func fetchFriends()  {
        
        friends = [
            FriendsListRowViewModel(friendId: "123", nickname: "Test Friend1", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4"),
            FriendsListRowViewModel(friendId: "123", nickname: "Test Friend2", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4"),
            FriendsListRowViewModel(friendId: "123", nickname: "Test Friend3", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4"),
        ]
    }
}
