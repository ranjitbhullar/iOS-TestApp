//
//  MockFriendsData.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
@testable import TestApp

struct MockFriendsDomainModel {

    static let friends: [FriendsListDomainModel]? = [
        FriendsListDomainModel(friendId: "123", nickname: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4"),
        FriendsListDomainModel(friendId: "123", nickname: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4"),
        FriendsListDomainModel(friendId: "123", nickname: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4")
        ]
}
