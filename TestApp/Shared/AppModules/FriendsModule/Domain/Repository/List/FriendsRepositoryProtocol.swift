//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

typealias FriendsDomainResponse = Promise<[FriendsListDomainModel]>

protocol FriendsRepositoryProtocol {
    func getFriends() -> FriendsDomainResponse
}
