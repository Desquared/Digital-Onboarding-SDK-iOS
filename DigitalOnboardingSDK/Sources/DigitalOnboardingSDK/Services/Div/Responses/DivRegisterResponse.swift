//
//  DivRegisterResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public struct DivRegisterResponse: Decodable {
    public let redirectUrl: String
    public let uuid: String
    
    private enum CodingKeys: String, CodingKey {
        case redirectUrl
        case uuid = "UUID"
    }
    
    public init(redirectUrl: String, uuid: String) {
        self.redirectUrl = redirectUrl
        self.uuid = uuid
    }
}
