//
//  MockFriendsData.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
@testable import TestApp

struct MockFriendsPresentationModel {

    static let friends: [FriendsListPresentationModel]? = [
        FriendsListPresentationModel(friendId: "123", nickname: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4"),
        FriendsListPresentationModel(friendId: "123", nickname: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4"),
        FriendsListPresentationModel(friendId: "123", nickname: "Test",  avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4")
        ]
}
