//
//  FriendsUseCaseProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

protocol FriendsListUseCaseProtocol {
    func getFriends() -> FriendsDomainResponse
}
