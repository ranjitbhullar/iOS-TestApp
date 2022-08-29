//
//  FriendsViewModel.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import Combine

final class FriendsListViewModel: ObservableObject, FriendsListViewModelProtocol {
    
    @Published var friends = [FriendsListRowViewModel]()
    @Published var errorMessage: String? = nil
    
    private let useCase: FriendsListUseCaseProtocol

    init(useCase: FriendsListUseCaseProtocol) {
        self.useCase = useCase
    }
    
    ///To fetch freinds list from the usecase
    func fetchFriends() {
        useCase.getFriends()
            .done(on: .main) { [weak self] model in
                self?.setData(friendsListDomainModel: model)
            }
            .catch(on: .main, policy: .allErrors) {[weak self] error in
                self?.errorMessage = error.localizedDescription
            }
    }

    ///To set friends list domain model data to view model
    private func setData(friendsListDomainModel: [FriendsListDomainModel]) {
        
        var frieldsList = [FriendsListRowViewModel]()
        friendsListDomainModel.forEach { domainModel in
            let presentationModel = FriendsListRowViewModel(friendId: domainModel.friendId,
                                                                 nickname: domainModel.nickname,
                                                                 avatarUrl: domainModel.avatarUrl
                                                                 )
            frieldsList.append(presentationModel)
        }
        self.friends = frieldsList
    }
}
