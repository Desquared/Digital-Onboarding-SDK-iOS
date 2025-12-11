//
//  URLConfigurationModel.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public struct URLConfigurationModel {
    public let baseURL: URL?
    public var defaultHeaders: [String: String]
    public let timeout: TimeInterval
    public let resourceTimeout: TimeInterval
    public let cacheMemoryMB: Int
    public let cacheDiskMB: Int
    public let waitsForConnectivity: Bool
    public let allowsCellularAccess: Bool
    
    public init(
        baseURL: URL?,
        defaultHeaders: [String: String] = [:],
        timeout: TimeInterval = 30,
        resourceTimeout: TimeInterval = 600,
        cacheMemoryMB: Int = 16,
        cacheDiskMB: Int = 64,
        waitsForConnectivity: Bool = true,
        allowsCellularAccess: Bool = true
    ) {
        self.baseURL = baseURL
        self.defaultHeaders = defaultHeaders
        self.timeout = timeout
        self.resourceTimeout = resourceTimeout
        self.cacheMemoryMB = cacheMemoryMB
        self.cacheDiskMB = cacheDiskMB
        self.waitsForConnectivity = waitsForConnectivity
        self.allowsCellularAccess = allowsCellularAccess
    }
}
