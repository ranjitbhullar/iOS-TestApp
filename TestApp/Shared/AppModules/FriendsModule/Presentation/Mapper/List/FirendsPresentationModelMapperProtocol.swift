//
//  FriendsPresentationModelMapperProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

protocol FriendsPresentationModelMapperProtocol {
    
    func mapToPresentationModel() -> [FriendsListPresentationModel]
}
