//
//  DataToDomainMapper.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

struct FriendsDataToDomainMapper: DataToDomainMapperProtocol {
    
    func transform<T, S>(data: T) -> S {
        
        let friendDto  = data as! [FriendDataModel]
        var friends : [FriendsListDomainModel]  = []
        friendDto.forEach { data in
            let domainModel = FriendsListDomainModel(friendId: String(data.id),
                                                    nickname: data.login,
                                                     avatarUrl: data.avatarUrl)
            friends.append(domainModel)
        }
        return friends as! S
    }
}
