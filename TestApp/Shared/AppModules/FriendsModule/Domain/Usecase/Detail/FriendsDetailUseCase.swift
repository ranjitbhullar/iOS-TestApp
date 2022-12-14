//
//  DetailUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

struct FriendsDetailUseCase: FriendsDetailUseCaseProtocol {    
    
    private let repository: FriendDetailRepositoryProtocol

    init(repository: FriendDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func getFriendDetailWith(friendId: String) -> FriendDomainResponse {
        return repository.getFriendWith(friendId: friendId)
    }
    
    func validateURL(for htmlString: String, completion: (Bool) -> ()) {
        if htmlString.isEmpty {
            completion(false)
        } else {
            completion(true)
        }
    }
}
