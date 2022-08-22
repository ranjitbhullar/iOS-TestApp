//
//  MockFriendsService.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit
@testable import TestApp

class MockFriendsService: FriendsServiceProtocol {

    var friends: [FriendDataModel]?
    var error: Error?

    func makeNetworkRequest() -> FriendsResponse {
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

