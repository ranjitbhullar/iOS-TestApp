//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

protocol DataToDomainMapperProtocol {
    
    func transform<T, S>(data: T) -> S
}
