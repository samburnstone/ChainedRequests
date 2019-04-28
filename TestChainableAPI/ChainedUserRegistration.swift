//
//  ChainedUserRegistration.swift
//  TestChainableAPI
//
//  Created by Sam Burnstone on 28/04/2019.
//  Copyright © 2019 Sam Burnstone. All rights reserved.
//

import Foundation

class ChainedUserRegistration {

    let statusClient = StatusServiceClient()
    let registrationClient = RegistrationServiceClient()
    let loginClient = LoginServiceClient()

    func makeChainedUserAPICall() {
        statusClient.onSuccess = { [unowned self] response in
            guard let statusCode = response["statusCode"] as? Int else { return }
            if statusCode == 0 {
                self.loginClient.login()
            } else if statusCode == 1 {
                self.registrationClient.registerUser()
            }
        }

        self.statusClient.fetchUserRegistrationStatus()
    }
}
