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
        expecatation = expectation(description: "Success")
        cacheManager?.setObjectForKey(object: NSString("Test Object"), key: cacheKey)
        if let _ = cacheManager?.objectForKey(key: cacheKey) {
            expecatation.fulfill()
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testCacheClearWithKey() {
        expecatation = expectation(description: "Success")
        cacheManager?.setObjectForKey(object: NSString("Test Object"), key: cacheKey)
        cacheManager?.clearCacheForKey(key: cacheKey)
        if let _ = cacheManager?.objectForKey(key: cacheKey) {
            
            XCTFail("Cache should not return in this case.")
        }
        else {
            expecatation.fulfill()
        }
            
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testCacheClearAllCache() {
        expecatation = expectation(description: "Success")
        cacheManager?.setObjectForKey(object: NSString("Test Object"), key: cacheKey)
        cacheManager?.clearAllCache()
        if let _ = cacheManager?.objectForKey(key: cacheKey) {
            
            XCTFail("Cache should not return in this case.")
        }
        else {
            expecatation.fulfill()
        }
            
        wait(for: [expecatation], timeout: 1.0)
    }
}
