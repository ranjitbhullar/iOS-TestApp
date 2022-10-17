//
//  FriendsRepository.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

struct FriendsRepository: FriendsRepositoryProtocol {
    
    private let dataStore: FriendsDataStoreProtocol
    private let mapper: DataToDomainMapperProtocol
    
    init(dataStore: FriendsDataStoreProtocol, mapper: DataToDomainMapperProtocol) {
        self.dataStore = dataStore
        self.mapper = mapper
    }
    
    func getFriends() -> FriendsDomainResponse {
        return Promise { seal in
            dataStore.fetchFriendsData().done { friendsDto in
                seal.fulfill(mapper.transform(data: friendsDto))
            }
            .catch(on: .main, policy: .allErrors) { error in
                seal.reject(error)
            }
        }
    }
}
