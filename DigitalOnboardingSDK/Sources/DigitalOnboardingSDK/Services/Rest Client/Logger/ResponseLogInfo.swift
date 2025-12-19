//
//  ResponseLogInfo.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

public struct ResponseLogInfo {
    public let requestId: String
    public let timestamp: Date
    public let statusCode: Int
    public let headers: [AnyHashable: Any]
    public let body: String?
    public let dataSize: Int
    public let duration: TimeInterval
    
    public init(requestId: String, timestamp: Date, statusCode: Int, headers: [AnyHashable: Any], body: String?, dataSize: Int, duration: TimeInterval) {
        self.requestId = requestId
        self.timestamp = timestamp
        self.statusCode = statusCode
        self.headers = headers
        self.body = body
        self.dataSize = dataSize
        self.duration = duration
    }
}
