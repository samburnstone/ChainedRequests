//
//  StatusServiceClient.swift
//  TestChainableAPI
//
//  Created by Sam Burnstone on 28/04/2019.
//  Copyright © 2019 Sam Burnstone. All rights reserved.
//

import Siesta

class StatusServiceClient: Service {

    let endpoint: String = "status"

    func fetchUserRegistrationStatus() {
        resource(endpoint).loadIfNeeded()?
            .onSuccess { entity in
            print(entity)
        }
    }
}
