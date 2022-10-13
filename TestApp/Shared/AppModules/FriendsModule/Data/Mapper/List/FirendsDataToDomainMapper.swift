//
//  DataToDomainMapper.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

struct FriendsDataToDomainMapper: FriendsDataToDomainMapperProtocol {
    
    func transform(data: [FriendDataModel]) -> [FriendsListDomainModel] {
        var friends : [FriendsListDomainModel]  = []
        data.forEach { data in
            let domainModel = FriendsListDomainModel(friendId: String(data.id),
                                                    nickname: data.login,
                                                     avatarUrl: data.avatarUrl)
            friends.append(domainModel)
        }
        return friends
    }
}
