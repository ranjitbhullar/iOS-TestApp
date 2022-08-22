//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

protocol FriendsDataStoreProtocol {
    func fetchFriendWith(friendId: String) -> FriendResponse
    func fetchFriendsData() -> FriendsResponse
}
