//
//  ConsoleRequestLogger.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

public class ConsoleRequestLogger: RequestLoggerProtocol {
    private let logLevel: LogLevel
    private let includeBody: Bool
    private let includeHeaders: Bool
    
    public enum LogLevel {
        case none
        case minimal    // Only URLs and status codes
        case standard   // URLs, status codes, durations
        case verbose    // Everything including headers
        case debug      // Everything including bodies
    }
    
    public init(logLevel: LogLevel = .standard, includeBody: Bool = false, includeHeaders: Bool = false) {
        self.logLevel = logLevel
        self.includeBody = includeBody
        self.includeHeaders = includeHeaders
    }
    
    public func logRequest(_ info: RequestLogInfo) {
        guard logLevel != .none else { return }
        
        let timestamp = formatTimestamp(info.timestamp)
        print("🔵 [REQUEST] [\(info.requestId)] \(timestamp)")
        print("   \(info.method) \(info.url)")
        
        if logLevel == .verbose || logLevel == .debug || includeHeaders {
            print("   Headers: \(info.headers)")
        }
        
        if (logLevel == .debug || includeBody), let body = info.body {
            print("   Body: \(body)")
        }
    }
    
    public func logResponse(_ info: ResponseLogInfo) {
        guard logLevel != .none else { return }
        
        let timestamp = formatTimestamp(info.timestamp)
        let statusEmoji = info.statusCode >= 200 && info.statusCode < 300 ? "🟢" : "🟡"
        
        print("\(statusEmoji) [RESPONSE] [\(info.requestId)] \(timestamp)")
        print("   Status: \(info.statusCode)")
        print("   Duration: \(String(format: "%.3f", info.duration))s")
        print("   Size: \(formatBytes(info.dataSize))")
        
        if logLevel == .verbose || logLevel == .debug || includeHeaders {
            print("   Headers: \(info.headers)")
        }
        
        if (logLevel == .debug || includeBody), let body = info.body {
            print("   Body: \(body)")
        }
    }
    
    public func logError(_ info: ErrorLogInfo) {
        guard logLevel != .none else { return }
        
        let timestamp = formatTimestamp(info.timestamp)
        print("🔴 [ERROR] [\(info.requestId)] \(timestamp)")
        print("   Type: \(info.errorType)")
        print("   Description: \(info.errorDescription)")
        print("   Duration: \(String(format: "%.3f", info.duration))s")
        
        if logLevel == .debug {
            print("   Full Error: \(info.error)")
        }
    }
    
    private func formatTimestamp(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter.string(from: date)
    }
    
    private func formatBytes(_ bytes: Int) -> String {
        if bytes < 1024 {
            return "\(bytes) bytes"
        } else if bytes < 1024 * 1024 {
            return String(format: "%.2f KB", Double(bytes) / 1024)
        } else {
            return String(format: "%.2f MB", Double(bytes) / (1024 * 1024))
        }
    }
}
