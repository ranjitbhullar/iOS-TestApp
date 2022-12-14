//
//  FriendsModule.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import UIKit
import SwiftUI
import Swinject

/// Builds up all the layer of Friends module.
struct FriendsModule {
    
    // MARK: - Friends Listing Dependenices
    // Builds up all the layer of Friends List.
    static func registerDependencies() {
        Dependency.container!.register(NetworkManagerProtocol.self) { r in
            NetworkManger()
        }
        Dependency.container!.register(CacheManagerProtocol.self) { r in
            CacheManager()
        }
        Dependency.container!.register(FriendsServiceProtocol.self) { r in
            FriendsService(network: r.resolve(NetworkManagerProtocol.self)!)
        }
        Dependency.container!.register(FriendsDataStoreProtocol.self) { r in
            FriendsDataStore(service: r.resolve(FriendsServiceProtocol.self)!,
                             cacheManager: r.resolve(CacheManagerProtocol.self)!)
        }
        Dependency.container!.register(DataToDomainMapperProtocol.self) { r in
            FriendsDataToDomainMapper()
        }
        Dependency.container!.register(FriendsRepositoryProtocol.self) { r in
            FriendsRepository(dataStore: r.resolve(FriendsDataStoreProtocol.self)!, mapper: r.resolve(DataToDomainMapperProtocol.self)!)
        }
        Dependency.container!.register(FriendsListUseCaseProtocol.self) { r in
            FriendsListUseCase(repository: r.resolve(FriendsRepositoryProtocol.self)!)
        }
        
        Dependency.container!.register(FriendsListViewModel.self) { r in
            FriendsListViewModel(useCase: r.resolve(FriendsListUseCaseProtocol.self)!)
        }
        Dependency.container!.register(FriendsListView.self) { r in
            FriendsListView(viewModel: r.resolve(FriendsListViewModel.self)!)
        }
    }
    
    static func getFriendsListView() -> FriendsListView {
       
        return (Dependency.container?.resolve(FriendsListView.self))!
    }
    
    // MARK: - Friends Detail Dependenices
    // Builds up all the layer of Friends Detail Screen.
    static func registerFriendDetail(friendId: String) {
        
        Dependency.container!.register(DataToDomainMapperProtocol.self) { r in
            FriendDataToDomainMapper()
        }
        Dependency.container!.register(FriendDetailRepositoryProtocol.self) { r in
            FriendDetailRepository(dataStore: r.resolve(FriendsDataStoreProtocol.self)!, mapper: r.resolve(DataToDomainMapperProtocol.self)!)
        }
        Dependency.container!.register(FriendsDetailUseCaseProtocol.self) { r in
            FriendsDetailUseCase(repository: r.resolve(FriendDetailRepositoryProtocol.self)!)
        }
        Dependency.container!.register(FriendDetailViewModel.self) { r in
            FriendDetailViewModel(friendId: friendId,
                                   useCase: r.resolve(FriendsDetailUseCaseProtocol.self)!)
        }
        Dependency.container!.register(FriendDetailView.self) { r in
            FriendDetailView(viewModel: r.resolve(FriendDetailViewModel.self)!)
        }
    }
    
    static func getFriendDetailView(friendId: String) -> FriendDetailView {
        registerFriendDetail(friendId: friendId)
        return (Dependency.container?.resolve(FriendDetailView.self))!
    }
}
