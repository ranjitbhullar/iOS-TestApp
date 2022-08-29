//
//  MockFriendsData.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
@testable import TestApp

struct MockFriendsData {

    static let friends: [FriendDataModel]? = [
        FriendDataModel(id: 123, login: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ),
        FriendDataModel(id: 123, login: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ),
        FriendDataModel(id: 123, login: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ),
        FriendDataModel(id: 123, login: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ),
        FriendDataModel(id: 123, login: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" )]
}

extension MockFriendsData {
    static func mockDictionary() -> Data {
        let encoded = try? JSONEncoder().encode(friends)
        return encoded ?? Data()
    }
}
