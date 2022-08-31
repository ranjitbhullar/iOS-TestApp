//
//  DataToDomainMapper.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

struct FriendsDataToDomainMapper: FriendsDataToDomainMapperProtocol {
    
    private var friendsDataModel: [FriendDataModel]

    init(dataModel: [FriendDataModel]) {
        friendsDataModel = dataModel
    }
    
    func dataToDomainMapper() -> [FriendsListDomainModel] {
        var friends : [FriendsListDomainModel]  = []
        friendsDataModel.forEach { data in
            let domainModel = FriendsListDomainModel(friendId: String(data.id),
                                                    nickname: data.login,
                                                     avatarUrl: data.avatarUrl)
            friends.append(domainModel)
        }
        return friends
    }
}
