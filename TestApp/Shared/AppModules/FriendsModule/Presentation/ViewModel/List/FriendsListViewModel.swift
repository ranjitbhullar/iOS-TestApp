//
//  FriendsViewModel.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

final class FriendsListViewModel: ObservableObject, FriendsListViewModelProtocol {
    
    @Published var friends = [FriendsListPresentationModel]()
    @Published var errorMessage: String? = nil
    
    private let useCase: FriendsListUseCaseProtocol

    init(useCase: FriendsListUseCaseProtocol) {
        self.useCase = useCase
    }

    func fetchFriends() {
        useCase.getFriends()
            .done(on: .main) { [weak self] model in
                self?.getData(model: model)
            }
            .catch(on: .main, policy: .allErrors) {[weak self] error in
                self?.errorMessage = error.localizedDescription
            }
    }

    private func getData(model: [FriendsListDomainModel]) {
        friends = FriendsPresentationModelMapper(domainModel: model).mapToPresentationModel()
    }
}
