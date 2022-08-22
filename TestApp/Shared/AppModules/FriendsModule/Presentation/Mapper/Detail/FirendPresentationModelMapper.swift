//
//  FriendPresentationModelMapper.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

class FriendPresentationModelMapper: FriendPresentationModelMapperProtocol  {
    
    private var friendDomainModel: FriendDetailDomainModel
    init(domainModel: FriendDetailDomainModel) {
        friendDomainModel = domainModel
    }
    
    func mapToPresentationModel() -> FriendDetailPresentationModel {
        
        var presentationModel = FriendDetailPresentationModel(friendId: friendDomainModel.friendId,
                                                             nickname: friendDomainModel.nickname,
                                                             username: friendDomainModel.username)
        presentationModel.avatarUrl = friendDomainModel.avatarUrl
        presentationModel.htmlUrl = friendDomainModel.htmlUrl
        return presentationModel
    }
}
