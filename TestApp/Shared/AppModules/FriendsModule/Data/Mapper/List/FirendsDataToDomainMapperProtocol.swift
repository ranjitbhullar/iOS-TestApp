//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

protocol FriendsDataToDomainMapperProtocol {
    
    func dataToDomainMapper() -> [FriendsListDomainModel]
}
