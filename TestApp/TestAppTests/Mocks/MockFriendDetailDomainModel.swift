//
//  MockFriendDetailDomainModel.swift
//  TestAppTests
//
//  Created by Ranjit Singh
//

import Foundation
@testable import TestApp

struct MockFriendDetailDomainModel {

    static let friend: FriendDetailDomainModel? =
    FriendDetailDomainModel(friendId: "123", nickname: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4")
}
