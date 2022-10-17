//
//  FriendsService.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

/// Makes network call after preparing url
struct FriendsService: FriendsServiceProtocol {

    private let network: NetworkManagerProtocol

    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    func makeNetworkRequest() -> FriendsResponse {
        let endPoint = AppConstants.ApiEndpoints.friendsApiUrl
        let url = URL(string: endPoint)
        guard let url = url else { return Promise.value([]) }
        let friendsResponse = network.request([FriendDataModel].self, endPoint: url)
        return friendsResponse
    }
}

