//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

typealias FriendDomainResponse = Promise<FriendDetailDomainModel>
typealias FriendsDomainResponse = Promise<[FriendsListDomainModel]>


protocol FriendsRepositoryProtocol {
    func getFriends() -> FriendsDomainResponse
    func getFriendWith(friendId: String) -> FriendDomainResponse
}
