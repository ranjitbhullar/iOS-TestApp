//
//  DetailViewModelProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

protocol FriendsDetailViewModelProtocol {
    
    var friendId: String { get }
    var validUrl: Bool { get }
    var errorMessage: String? { get }
    
    func fetchFriendDetails()
    func validateUrl()
}
