//
//  FriendsDataModel.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

struct FriendDataModel: Codable, Hashable {
    var id: Int
    var login: String
    var avatarUrl: String
    var username: String
    var htmlUrl: String
}
