//
//  DetailViewModel.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

final class FriendDetailViewModel: ObservableObject, FriendsDetailViewModelProtocol {
    
    var friendId: String
    @Published var username: String?
    @Published var avatarUrl: String?
    @Published var htmlUrl: String?
    @Published var validUrl: Bool = false
    @Published var errorMessage: String? = nil
      
    private let useCase: FriendsDetailUseCaseProtocol

    // MARK: - Initialise
    init(friendId: String, useCase: FriendsDetailUseCaseProtocol) {
        self.friendId = friendId
        self.useCase = useCase
    }

    // MARK: - Method
    
    func fetchFriendDetails() {
        useCase.getFriendDetailWith(friendId: friendId)
            .done(on: .main) { [weak self] domainModel in
                self?.setData(friendDomainModel: domainModel)
            }
            .catch(on: .main, policy: .allErrors) {[weak self] error in
                self?.errorMessage = error.localizedDescription
            }
    }
    
    private func setData(friendDomainModel: FriendDetailDomainModel) {
        
        self.username = friendDomainModel.username
        self.avatarUrl = friendDomainModel.avatarUrl
        self.htmlUrl = friendDomainModel.htmlUrl
    }
    
    func validateUrl() {
        let htmlURL = self.htmlUrl ?? ""
        self.useCase.validateURL(for: htmlURL) { result in
            if result {
                validUrl = true
            } else {
                validUrl = false
            }
        }
    }
}
