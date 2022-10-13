//
//  DataToDomainMapper.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

class FriendDataToDomainMapper: FriendDataToDomainMapperProtocol {
    
    func transform(data: FriendDataModel) -> FriendDetailDomainModel {
       
        var friendDomainModel = FriendDetailDomainModel(friendId: String(data.id),
                                                        nickname: data.login,
                                                        username: data.username)
        friendDomainModel.avatarUrl = data.avatarUrl
        friendDomainModel.htmlUrl = data.htmlUrl
            
        return friendDomainModel
    }
}
