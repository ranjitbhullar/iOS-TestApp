//
//  CacheManager.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

let dataCache = NSCache<NSString, AnyObject>()

class CacheManager: CacheManagerProtocol {
    
    func objectForKey(key: String) -> AnyObject? {
        
        return dataCache.object(forKey: NSString(string: key))
    }
    
    func setObjectForKey(object: AnyObject, key: String) {
        
        dataCache.setObject(object, forKey: NSString(string: key))
    }
    
    func clearCacheForKey(key: String) {
        
        dataCache.removeObject(forKey: NSString(string: key))
    }
    
    func clearAllCache() {
        
        dataCache.removeAllObjects()
    }
}
