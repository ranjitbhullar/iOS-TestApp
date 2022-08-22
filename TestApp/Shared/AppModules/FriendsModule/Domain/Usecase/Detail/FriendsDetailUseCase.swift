//
//  DetailUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

class FriendsDetailUseCase: FriendsDetailUseCaseProtocol {    
    
    private let repository: FriendsRepositoryProtocol

    init(repository: FriendsRepositoryProtocol) {
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
