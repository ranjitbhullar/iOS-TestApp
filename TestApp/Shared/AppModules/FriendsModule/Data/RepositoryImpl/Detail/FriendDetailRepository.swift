//
//  FriendsRepository.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

struct FriendDetailRepository: FriendDetailRepositoryProtocol {
    
    private let dataStore: FriendsDataStoreProtocol
    private let mapper: FriendDataToDomainMapperProtocol
    
    init(dataStore: FriendsDataStoreProtocol, mapper: FriendDataToDomainMapperProtocol) {
        self.dataStore = dataStore
        self.mapper = mapper
    }
    
    func getFriendWith(friendId: String) -> FriendDomainResponse {
        return Promise { seal in
            dataStore.fetchFriendWith(friendId: friendId).done { friendDto in
              
                seal.fulfill(mapper.transform(data: friendDto))
            }
            .catch(on: .main, policy: .allErrors) { error in
                seal.reject(error)
            }
        }
    }
}
