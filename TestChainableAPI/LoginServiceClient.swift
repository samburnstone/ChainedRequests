//
//  LoginServiceClient.swift
//  TestChainableAPI
//
//  Created by Sam Burnstone on 28/04/2019.
//  Copyright © 2019 Sam Burnstone. All rights reserved.
//

import Siesta

class LoginServiceClient: Service {

    typealias Response = [String: Any]

    var onSuccess: ((Response) -> Void)?

    let endpoint: String = "login"

    required init() {
        super.init(baseURL: "https://www.foo.com")
    }

    @discardableResult
    func login() -> Self {
        resource(endpoint).request(.post)
        return self
    }
}
