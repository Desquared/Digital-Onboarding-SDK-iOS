//
//  RequestLoggerProtocol.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

/// Protocol for custom logging implementations
public protocol RequestLoggerProtocol {
    func logRequest(_ info: RequestLogInfo)
    func logResponse(_ info: ResponseLogInfo)
    func logError(_ info: ErrorLogInfo)
}
