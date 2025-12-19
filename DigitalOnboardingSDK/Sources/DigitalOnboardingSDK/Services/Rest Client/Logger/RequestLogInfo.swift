//
//  RequestLogInfo.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

public struct RequestLogInfo {
    public let requestId: String
    public let timestamp: Date
    public let url: String
    public let method: String
    public let headers: [String: String]
    public let body: String?
    public let endpoint: String
    
    public init(requestId: String, timestamp: Date, url: String, method: String, headers: [String: String], body: String?, endpoint: String) {
        self.requestId = requestId
        self.timestamp = timestamp
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
        self.endpoint = endpoint
    }
}
