//
//  FriendsViewModelProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

protocol FriendsListViewModelProtocol {
    var friends: [FriendsListRowViewModel] { get }
    var errorMessage: String? { get }
    func fetchFriends()
}
