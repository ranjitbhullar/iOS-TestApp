//
//  FriendsModule.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import UIKit
import SwiftUI

/// Builds up all the layer of Friends module.
final class FriendsModule {

    static let networkManager: NetworkManagerProtocol = NetworkManger()
}

// MARK: - Friends Listing Dependenices
// Builds up all the layer of Friends List.
extension FriendsModule {

    static func createFriendListView() -> FriendsListView {

        return FriendsListView(viewModel: createFriendsListViewModel())
    }
    
    //injecting use case layer
    static func createFriendsListViewModel() -> FriendsListViewModel {
        let viewModel = FriendsListViewModel(useCase: createFriendsListUseCase())
        return viewModel
    }
    
    //injecting repository layer
    static func createFriendsListUseCase() -> FriendsListUseCaseProtocol {
        let useCase = FriendsListUseCase(repository: createFriendsRepository())
        return useCase
    }
}

// MARK: - Friends Detail Dependenices
// Builds up all the layer of Friends Detail Screen.
extension FriendsModule {

    static func createFriendDetailView(friendId: String) -> FriendDetailView {

        return FriendDetailView(viewModel: createFriendDetailViewModel(friendId: friendId))
    }
    
    ///use case injected to view model
    static func createFriendDetailViewModel(friendId: String) -> FriendDetailViewModel {
        let viewModel = FriendDetailViewModel(friendId: friendId, useCase: createFriendDetailUseCase())
        return viewModel
    }

    
    //injecting repository layer
    static func createFriendDetailUseCase() -> FriendsDetailUseCaseProtocol {
        let useCase = FriendsDetailUseCase(repository: createFriendsRepository())
        return useCase
    }
}

// MARK: - Common Dependenices
/// Builds up all the common layer depencies
extension FriendsModule {
    
    //injecting data layer
    static func createFriendsRepository() -> FriendsRepositoryProtocol {
        let repository = FriendsRepository(dataStore: createDataStore())
        return repository
    }
    
    //injecting data service layer
    static func createDataStore() -> FriendsDataStoreProtocol {
        let dataStore = FriendsDataStore(service: createFriendsService(), cacheManager:createCache())
        return dataStore
    }
    
    // injecting network layer
    static func createFriendsService() -> FriendsServiceProtocol {
        let service = FriendsService(network: networkManager)
        return service
    }
    
    // injecting cache layer
    static func createCache() -> CacheManager {
        let cacheManager = CacheManager()
        return cacheManager
    }
}
