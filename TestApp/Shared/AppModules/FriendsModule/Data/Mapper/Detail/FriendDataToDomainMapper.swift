//
//  DataToDomainMapper.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

class FriendDataToDomainMapper: FriendDataToDomainMapperProtocol {
    
    private var friendDataModel: FriendDataModel

    init(dataModel: FriendDataModel) {
        self.friendDataModel = dataModel
    }
    
    func dataToDomainMapper() -> FriendDetailDomainModel {
       
        var friendDomainModel = FriendDetailDomainModel(friendId: String(friendDataModel.id),
                                                        nickname: friendDataModel.login,
                                                        username: friendDataModel.username)
        friendDomainModel.avatarUrl = friendDataModel.avatarUrl
        friendDomainModel.htmlUrl = friendDataModel.htmlUrl
            
        return friendDomainModel
    }
}
