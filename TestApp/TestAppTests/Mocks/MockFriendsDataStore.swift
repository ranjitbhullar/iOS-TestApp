//
//  MockFriendsDataStore.swift
//  TestAppTests
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

@testable import TestApp

class MockFriendsDataStore: FriendsDataStoreProtocol {

    var friends: [FriendDataModel]?
    var friend: FriendDataModel?
    var error: Error?
    
    func fetchFriendWith(friendId: String) -> FriendResponse {
        
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
    
    func fetchFriendsData() -> FriendsResponse {
        
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
