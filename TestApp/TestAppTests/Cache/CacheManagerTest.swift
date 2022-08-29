//
//  CacheManagerTest.swift
//  TestAppTests
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class CacheManagerTest: XCTestCase {

    var cacheManager: CacheManagerProtocol?
    var expecatation: XCTestExpectation!
    let cacheKey = "TestKey"

    override func setUpWithError() throws {
        cacheManager = CacheManager()
    }
    
    override func tearDownWithError() throws {
        cacheManager = nil
    }

    func testCacheSetObject() {
        
        XCTAssertNil(cacheManager?.objectForKey(key: cacheKey))
        cacheManager?.setObjectForKey(object: NSString("Test Object"), key: cacheKey)
        XCTAssertNotNil(cacheManager?.objectForKey(key: cacheKey))
    }
    
    func testCacheClearWithKey() {

        cacheManager?.setObjectForKey(object: NSString("Test Object"), key: cacheKey)
        XCTAssertNotNil(cacheManager?.objectForKey(key: cacheKey))
        
        cacheManager?.clearCacheForKey(key: cacheKey)
        XCTAssertNil(cacheManager?.objectForKey(key: cacheKey))
    }
    
    func testCacheClearAllCache() {
        
        cacheManager?.setObjectForKey(object: NSString("Test Object"), key: cacheKey)
        XCTAssertNotNil(cacheManager?.objectForKey(key: cacheKey))
        
        cacheManager?.clearAllCache()
        XCTAssertNil(cacheManager?.objectForKey(key: cacheKey))
    }
}
