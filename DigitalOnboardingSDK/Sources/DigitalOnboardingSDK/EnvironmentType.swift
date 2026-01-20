//
//  EnvironmentType.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

/// Environment types for the SDK
/// Supports predefined environments or custom base URLs
public enum EnvironmentType {
    case production
    case sit
    case uat
    case custom(baseURL: URL)
    
    /// The base URL for the environment
    public var baseURL: URL {
        switch self {
        case .production:
            return URL(string: "https://div-lp-commerce.cosmote.gr")!
        case .sit:
            return URL(string: "https://div-lp-sit-commerce.uatjx.cosmote.gr")!
        case .uat:
            return URL(string: "https://div-lp-uat-commerce.uatjx.cosmote.gr")!
        case .custom(let baseURL):
            return baseURL
        }
    }
}
