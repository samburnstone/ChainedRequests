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

    var chained = ChainedUserRegistration()

    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
    }

    func test_it_calls_status_endpoint() {
        let expectation = XCTestExpectation(description: "It calls the status API")

        stub(condition: isPath("/status")) { _ in
            let obj: [String: Any] = ["statusCode": 0]
            expectation.fulfill()
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }

        chained.makeChainedUserAPICall()

        wait(for: [expectation], timeout: 5)
    }

    func test_call_to_login_endpoint_is_made_if_status_endpoint_returns_statusCode_0() {
        let expectation = XCTestExpectation(description: "It calls the login API")

        stub(condition: isPath("/status")) { _ in
            let obj: [String: Any] = ["statusCode": 0]
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }

        stub(condition: isPath("/login")) { _ in
            expectation.fulfill()
            let response = [String: Any]()
            return OHHTTPStubsResponse(jsonObject: response, statusCode: 200, headers: nil)
        }

        chained.makeChainedUserAPICall()

        wait(for: [expectation], timeout: 5)
    }

    func test_call_to_register_endpoint_is_made_if_status_endpoint_returns_statusCode_1() {
        let expectation = XCTestExpectation(description: "It calls the login API")

        stub(condition: isPath("/status")) { _ in
            let obj: [String: Any] = ["statusCode": 1]
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }

        stub(condition: isPath("/register")) { _ in
            expectation.fulfill()
            let response = [String: Any]()
            return OHHTTPStubsResponse(jsonObject: response, statusCode: 200, headers: nil)
        }

        chained.makeChainedUserAPICall()

        wait(for: [expectation], timeout: 5)
    }
}
