//
//  MockCacheManager.swift
//  TestAppTests
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

@testable import TestApp

class MockCacheManager: CacheManagerProtocol {
    
    var friends: [FriendDataModel]?
    
    func setObjectForKey(object: AnyObject, key: String) {
        
    }
    
    func clearCacheForKey(key: String) {
        
    }
    
    func clearAllCache() {
        
    }
    
    func objectForKey(key: String) -> AnyObject? {
        
        if let friends = friends {
            return Promise.value(friends)
        }
        
        return nil
    }
}
