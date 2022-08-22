//
//  MockFriendsNetworkManager.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit
@testable import TestApp

class MockFriendsNetworkManager: NetworkManagerProtocol {

    var friends: [FriendDataModel]?
    var error: Error?

    func request<T: Codable>(_ type: T.Type, endPoint: URL) -> Response<T> {
        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let friend = friends {
                    seal.fulfill(friend as! T)
                } else {
                    seal.reject(NSError(domain: "com.test.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"]))
                }
            }
        }
    }
}
