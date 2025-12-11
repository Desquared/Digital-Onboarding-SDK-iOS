//
//  ErrorLogInfo.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

public struct ErrorLogInfo {
    public let requestId: String
    public let timestamp: Date
    public let error: Error
    public let errorType: String
    public let errorDescription: String
    public let duration: TimeInterval
    
    public init(requestId: String, timestamp: Date, error: Error, errorType: String, errorDescription: String, duration: TimeInterval) {
        self.requestId = requestId
        self.timestamp = timestamp
        self.error = error
        self.errorType = errorType
        self.errorDescription = errorDescription
        self.duration = duration
    }
}
