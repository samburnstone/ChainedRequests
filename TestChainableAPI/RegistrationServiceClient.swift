//
//  RegistrationServiceClient.swift
//  TestChainableAPI
//
//  Created by Sam Burnstone on 28/04/2019.
//  Copyright © 2019 Sam Burnstone. All rights reserved.
//

import Siesta

class RegistrationServiceClient: Service {

    typealias Response = [String: Any]

    var onSuccess: ((Response) -> Void)?

    let endpoint: String = "register"

    required init() {
        super.init(baseURL: "https://www.foo.com")
    }

    @discardableResult
    func registerUser() -> Self {
        _ = resource(endpoint).request(.post)
        return self
    }
}
