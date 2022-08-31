//
//  MockDetailUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

@testable import TestApp

struct MockFriendDetailUseCase: FriendsDetailUseCaseProtocol {
    
    var friend: FriendDetailDomainModel?
    var error: Error?
    
    func getFriendDetailWith(friendId: String) -> FriendDomainResponse {
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
    

    func validateURL(for htmlString: String, completion: (Bool) -> ()) {
        if htmlString.isEmpty {
            completion(false)
        } else {
            completion(true)
        }
    }
}
