//
//  DataToDomainMapper.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

class FriendDataToDomainMapper: DataToDomainMapperProtocol {
    
    func transform<T, S>(data: T) -> S {
        
        let friendDto  = data as! FriendDataModel
        var friendDomainModel = FriendDetailDomainModel(friendId: String(friendDto.id),
                                                        nickname: friendDto.login,
                                                        username: friendDto.username)
        friendDomainModel.avatarUrl = friendDto.avatarUrl
        friendDomainModel.htmlUrl = friendDto.htmlUrl
            
        return friendDomainModel as! S
    }
}
