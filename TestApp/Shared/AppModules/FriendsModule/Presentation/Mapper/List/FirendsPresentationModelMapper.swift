//
//  FriendsPresentationModelMapper.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

class FriendsPresentationModelMapper: FriendsPresentationModelMapperProtocol  {
    
    private var friendsDomainModel: [FriendsListDomainModel]
    
    init(domainModel: [FriendsListDomainModel]) {
        friendsDomainModel = domainModel
    }
    
    func mapToPresentationModel() -> [FriendsListPresentationModel] {
        var friends : [FriendsListPresentationModel]  = []
            
        friendsDomainModel.forEach { domainModel in
            let presentationModel = FriendsListPresentationModel(friendId: domainModel.friendId,
                                                                 nickname: domainModel.nickname,
                                                                 avatarUrl: domainModel.avatarUrl
                                                                 )            
            friends.append(presentationModel)
        }
        return friends
    }
}
