//
//  URLConfigurationModel.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

/// Configuration model for REST API client network settings.
/// Encapsulates all URLSession configuration parameters including base URL,
/// headers, timeouts, caching policies, and connectivity options.
public struct URLConfigurationModel {
    /// The base URL for all API requests. Endpoints will be appended to this URL.
    public let baseURL: URL?
    
    /// Default HTTP headers to be included in all requests.
    /// Common headers include Content-Type, Accept, Authorization, etc.
    public var defaultHeaders: [String: String]
    
    /// The timeout interval for individual requests in seconds.
    /// Default is 30 seconds.
    public let timeout: TimeInterval
    
    /// The maximum time interval for an entire resource download in seconds.
    /// Default is 600 seconds (10 minutes).
    public let resourceTimeout: TimeInterval
    
    /// The maximum memory cache size in megabytes.
    /// Default is 16 MB.
    public let cacheMemoryMB: Int
    
    /// The maximum disk cache size in megabytes.
    /// Default is 64 MB.
    public let cacheDiskMB: Int
    
    /// Whether the session should wait for connectivity before attempting requests.
    /// When true, requests will wait for network connectivity rather than failing immediately.
    /// Default is true.
    public let waitsForConnectivity: Bool
    
    /// Whether the session is allowed to use cellular network connections.
    /// When false, requests will only be sent over WiFi.
    /// Default is true.
    public let allowsCellularAccess: Bool
    public let logger: RequestLoggerProtocol?
    
    /// Initializes a new URL configuration model with network settings.
    /// - Parameters:
    ///   - baseURL: The base URL for all API requests.
    ///   - defaultHeaders: Default HTTP headers to include in all requests. Defaults to empty dictionary.
    ///   - timeout: The timeout interval for requests in seconds. Defaults to 30 seconds.
    ///   - resourceTimeout: The maximum time for resource downloads in seconds. Defaults to 600 seconds.
    ///   - cacheMemoryMB: The maximum memory cache size in MB. Defaults to 16 MB.
    ///   - cacheDiskMB: The maximum disk cache size in MB. Defaults to 64 MB.
    ///   - waitsForConnectivity: Whether to wait for connectivity before failing. Defaults to true.
    ///   - allowsCellularAccess: Whether cellular network access is allowed. Defaults to true.
    public init(
        baseURL: URL?,
        defaultHeaders: [String: String] = [:],
        timeout: TimeInterval = 30,
        resourceTimeout: TimeInterval = 600,
        cacheMemoryMB: Int = 16,
        cacheDiskMB: Int = 64,
        waitsForConnectivity: Bool = true,
        allowsCellularAccess: Bool = true,
        logger: RequestLoggerProtocol? = nil
    ) {
        self.baseURL = baseURL
        self.defaultHeaders = defaultHeaders
        self.timeout = timeout
        self.resourceTimeout = resourceTimeout
        self.cacheMemoryMB = cacheMemoryMB
        self.cacheDiskMB = cacheDiskMB
        self.waitsForConnectivity = waitsForConnectivity
        self.allowsCellularAccess = allowsCellularAccess
        self.logger = logger
    }
}
