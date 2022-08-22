//
//  DetailViewModel.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

final class FriendsDetailViewModel: ObservableObject, FriendsDetailViewModelProtocol {
    
    var friendId: String
    @Published var friend: FriendDetailPresentationModel?
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
            .done(on: .main) { [weak self] model in
                self?.getData(model: model)
            }
            .catch(on: .main, policy: .allErrors) {[weak self] error in
                self?.errorMessage = error.localizedDescription
            }
    }
    
    private func getData(model: FriendDetailDomainModel) {
        
        friend = FriendPresentationModelMapper(domainModel: model).mapToPresentationModel()
    }
    
    func validateUrl() {
        let htmlURL = friend?.htmlUrl ?? ""
        self.useCase.validateURL(for: htmlURL) { result in
            if result {
                validUrl = true
            } else {
                validUrl = false
            }
        }
    }
}
