//
//  MockFriendsUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit
@testable import TestApp

class MockFriendsListUseCase: FriendsListUseCaseProtocol {

    var friend: [FriendsListDomainModel]?
    var error: Error?

    func getFriends() -> FriendsDomainResponse {
        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let friend = friend {
                    seal.fulfill(friend)
                }
            }
        }
    }
}
