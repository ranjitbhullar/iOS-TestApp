//
//  FriendsServiceProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

typealias FriendResponse = Promise<FriendDataModel>
typealias FriendsResponse = Promise<[FriendDataModel]>

protocol FriendsServiceProtocol {
    func makeNetworkRequest() -> FriendsResponse
}
