//
//  Friend.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

struct FriendsListPresentationModel : Identifiable {
    let id = UUID() 
    var friendId: String
    var nickname: String
    var avatarUrl: String?
}
