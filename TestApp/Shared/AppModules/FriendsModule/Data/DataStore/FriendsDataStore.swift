//
//  DataStore.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

class FriendsDataStore: FriendsDataStoreProtocol {
    private let service: FriendsServiceProtocol
    private let cacheManager: CacheManagerProtocol
    init(service: FriendsServiceProtocol, cacheManager: CacheManagerProtocol) {
        self.service = service
        self.cacheManager = cacheManager
    }
    
    func fetchFriendWith(friendId: String) -> FriendResponse {
        
        return Promise { seal in
            fetchFriendsData().done { friendsData in
                friendsData.forEach { model in
                    if (String(model.id) == friendId) {
                        seal.fulfill(model)
                    }
                }
            }
            .catch(on: .main, policy: .allErrors) { error in
                seal.reject(error)
            }
        }
    }
    
    func fetchFriendsData() -> FriendsResponse {
        let cacheKey = AppConstants.ApiEndpoints.friendsApiUrl
        if let model = cacheManager.objectForKey(key: cacheKey) {
            return model as! FriendsResponse
        }
        let dataModel = service.makeNetworkRequest()
        cacheManager.setObjectForKey(object: dataModel, key: cacheKey)
        return dataModel
    }
}
