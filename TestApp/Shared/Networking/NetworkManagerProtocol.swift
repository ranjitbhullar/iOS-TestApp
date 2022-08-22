//
//  NetworkManagerProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

typealias Response<T> = Promise<T>


protocol NetworkManagerProtocol {
    func request<T: Codable>(_ type: T.Type, endPoint: URL) -> Response<T>
}
