//
//  StatusServiceClient.swift
//  TestChainableAPI
//
//  Created by Sam Burnstone on 28/04/2019.
//  Copyright © 2019 Sam Burnstone. All rights reserved.
//

import Siesta

class StatusServiceClient: Service {

    typealias Response = [String: Any]

    var onSuccess: ((Response) -> Void)?

    let endpoint: String = "status"

    required init() {
        super.init(baseURL: "https://www.foo.com")
    }

    @discardableResult
    func fetchUserRegistrationStatus() -> Self {
        resource(endpoint).loadIfNeeded()?
            .onSuccess { [unowned self] response in
                let response: Response = response.typedContent() ?? [:]
            self.onSuccess?(response)
        }
        return self
    }
}
