//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

protocol FriendDataToDomainMapperProtocol {
    
    func dataToDomainMapper() -> FriendDetailDomainModel
}
