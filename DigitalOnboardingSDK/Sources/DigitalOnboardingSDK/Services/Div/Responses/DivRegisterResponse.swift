//
//  DivRegisterResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public struct DivRegisterResponse: Codable {
    public let redirectUrl: String
    public let uuid: String
    
    public init(redirectUrl: String, uuid: String) {
        self.redirectUrl = redirectUrl
        self.uuid = uuid
    }
}
