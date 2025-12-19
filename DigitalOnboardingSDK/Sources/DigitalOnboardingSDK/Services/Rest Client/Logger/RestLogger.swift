//
//  RestLogger.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

extension RestApiClient {
    func logRequest(
        logger: RequestLoggerProtocol?,
        request: URLRequest,
        startTime: Date,
        requestId: String,
        endpoint: String
    ) {
        if let logger = logger {
            let requestInfo = RequestLogInfo(
                requestId: requestId,
                timestamp: startTime,
                url: request.url?.absoluteString ?? "",
                method: request.httpMethod ?? "",
                headers: request.allHTTPHeaderFields ?? [:],
                body: request.httpBody.flatMap { String(data: $0, encoding: .utf8) },
                endpoint: endpoint
            )
            logger.logRequest(requestInfo)
        }
    }
    
    func logResponse(
        logger: RequestLoggerProtocol?,
        response: URLResponse,
        requestId: String,
        data: Data,
        startTime: Date
    ) {
        if let logger = logger,
            let httpResponse = response as? HTTPURLResponse {
            let duration = Date().timeIntervalSince(startTime)
            let responseInfo = ResponseLogInfo(
                requestId: requestId,
                timestamp: Date(),
                statusCode: httpResponse.statusCode,
                headers: httpResponse.allHeaderFields,
                body: String(data: data, encoding: .utf8),
                dataSize: data.count,
                duration: duration
            )
            logger.logResponse(responseInfo)
        }
    }
    
    func logError(
        logger: RequestLoggerProtocol?,
        requestId: String,
        error: Error,
        startTime: Date
    ) {
        if let logger = logger {
            let duration = Date().timeIntervalSince(startTime)
            let errorInfo = ErrorLogInfo(
                requestId: requestId,
                timestamp: Date(),
                error: error,
                errorType: String(describing: type(of: error)),
                errorDescription: error.localizedDescription,
                duration: duration
            )
            logger.logError(errorInfo)
        }
    }
}
