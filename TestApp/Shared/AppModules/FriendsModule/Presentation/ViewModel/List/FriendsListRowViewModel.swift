//
//  Friend.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

final class FriendsListRowViewModel : FriendsListRowViewModelProtocol, Identifiable {
    
    let id = UUID()
    var friendId: String
    var nickname: String
    var avatarUrl: String?
    
    init (friendId: String, nickname: String, avatarUrl: String?) {
        
        self.friendId = friendId
        self.nickname = nickname
        self.avatarUrl = avatarUrl
    }
}
