//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

typealias FriendDomainResponse = Promise<FriendDetailDomainModel>

protocol FriendDetailRepositoryProtocol {
    func getFriendWith(friendId: String) -> FriendDomainResponse
}
