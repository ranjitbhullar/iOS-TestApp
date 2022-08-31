//
//  FriendsUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

struct FriendsListUseCase: FriendsListUseCaseProtocol {

    private let repository: FriendsRepositoryProtocol

    init(repository: FriendsRepositoryProtocol) {
        self.repository = repository
    }

    func getFriends() -> FriendsDomainResponse {
        return repository.getFriends()
    }
}
