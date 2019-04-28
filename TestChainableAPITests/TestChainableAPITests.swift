//
//  TestChainableAPITests.swift
//  TestChainableAPITests
//
//  Created by Sam Burnstone on 28/04/2019.
//  Copyright © 2019 Sam Burnstone. All rights reserved.
//

import OHHTTPStubs
import XCTest
@testable import TestChainableAPI

class TestChainableAPITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_call_to_login_endpoint_is_made_if_status_endpoint_returns_statusCode_0() {
        let expectation = XCTestExpectation(description: "It calls the API")

        stub(condition: isPath("/status")) { _ in
            let obj: [String: Any] = ["statusCode": 0]
            expectation.fulfill()
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }

        let statusServiceClient = StatusServiceClient(baseURL: "https://www.foo.com")
        statusServiceClient.fetchUserRegistrationStatus()

        wait(for: [expectation], timeout: 5)
    }

    func test_call_to_register_endpoint_is_made_if_status_endpoint_returns_statusCode_1() {
    }
}
