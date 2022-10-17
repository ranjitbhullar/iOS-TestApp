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
    private let mapper: DataToDomainMapperProtocol
    
    init(dataStore: FriendsDataStoreProtocol, mapper: DataToDomainMapperProtocol) {
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
