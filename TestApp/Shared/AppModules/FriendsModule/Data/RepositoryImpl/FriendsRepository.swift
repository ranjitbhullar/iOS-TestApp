//
//  FriendsRepository.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

/// Passes data to service layer and returns back response 
class FriendsRepository: FriendsRepositoryProtocol {
    
    private let dataStore: FriendsDataStoreProtocol
    init(dataStore: FriendsDataStoreProtocol) {
        self.dataStore = dataStore
    }
    
    func getFriendWith(friendId: String) -> FriendDomainResponse {
        return Promise { seal in
            dataStore.fetchFriendWith(friendId: friendId).done { friendData in
                let mapper = FriendDataToDomainMapper(dataModel: friendData)
                seal.fulfill(mapper.dataToDomainMapper())
            }
            .catch(on: .main, policy: .allErrors) { error in
                seal.reject(error)
            }
        }
    }
    
    func getFriends() -> FriendsDomainResponse {
        return Promise { seal in
            dataStore.fetchFriendsData().done { dataModel in
                let mapper = FriendsDataToDomainMapper(dataModel: dataModel)
                seal.fulfill(mapper.dataToDomainMapper())
            }
            .catch(on: .main, policy: .allErrors) { error in
                seal.reject(error)
            }
        }
    }
}
