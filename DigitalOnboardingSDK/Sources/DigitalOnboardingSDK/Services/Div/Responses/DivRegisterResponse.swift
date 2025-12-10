//
//  DivRegisterResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public struct DivRegisterResponse: Decodable {
    private let redirectUrl: String
    private let UUID: String
    
    public init(redirectUrl: String, UUID: String) {
        self.redirectUrl = redirectUrl
        self.UUID = UUID
    }
}
