//
//  MockFriendsRepository.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit
@testable import TestApp

struct MockFriendsRepository: FriendsRepositoryProtocol {
    
    var friends: [FriendsListDomainModel]?
    var friend: FriendDetailDomainModel?
    var error: Error?
    
    func getFriendWith(friendId: String) -> FriendDomainResponse {

        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let friend = friend {
                    seal.fulfill(friend)
                } else {
                    seal.reject(NSError(domain: "com.test.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"]))
                }
            }
        }
    }
    
    func getFriends() -> FriendsDomainResponse {
        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let friends = friends {
                    seal.fulfill(friends)
                } else {
                    seal.reject(NSError(domain: "com.test.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"]))
                }
            }
        }
    }
}
