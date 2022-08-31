//
//  NetworkManagerTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
@testable import TestApp

class NetworkManagerTest: XCTestCase {

    var networkManager: NetworkManagerProtocol?
    let testUrl = URL(string: "TestURL")

    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        networkManager = NetworkManger(session: urlSession)
    }
    
    override func tearDownWithError() throws {
        networkManager = nil
    }

    func test_NetworkClass_ForSuccess() {

        let expecatation = expectation(description: "Success case for Network")

        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw NSError(domain: "URL", code: NSURLErrorBadURL, userInfo: nil)
            }

            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)

            guard let response = response else { return (HTTPURLResponse(),Data()) }
            return (response, MockFriendsData.mockDictionary())
        }
        guard let testUrl = testUrl,
              let networkManager = networkManager else { return }
        networkManager.request([FriendDataModel].self, endPoint: testUrl)
            .done { friends in
                XCTAssertGreaterThanOrEqual(friends.count, 1)
                expecatation.fulfill()
            }.catch { error in
                XCTFail("Error was not expected in this case: \(error)")
            }

        wait(for: [expecatation], timeout: 1.0)
    }

    func test_Parsing_Failure() {
        let expectation = expectation(description: "Parsing Failure occured")
        // Prepare response
        let data = Data()
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                throw NSError(domain: "URL", code: NSURLErrorBadURL, userInfo: nil)
            }
            let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: nil, headerFields: nil)
            guard let response = response else { return (HTTPURLResponse(),Data()) }
            return (response, data)
        }

        guard let testUrl = testUrl,
              let networkManager = networkManager else { return }
        networkManager.request(FriendDataModel.self, endPoint: testUrl)
            .done { model in
                XCTFail("Success response was not expected in this case.")
            }.catch { error in
                XCTAssertEqual(error.localizedDescription,
                "The data couldn’t be read because it isn’t in the correct format.")
                
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 1.0)
    }
}
