//
//  NetworkError.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public enum NetworkError: LocalizedError, Equatable {
    case invalidURL
    case invalidRequest
    case invalidResponse
    case decodingError(String)
    case encodingError(String)
    case serverError(Int, String)
    case clientError(Int, String)
    case networkError(String)
    case timeout
    case noData
    case cancelled
    case pinnedCertificateMismatch
    case unsupportedMediaType
    case malformedJSON
    case unknownError(String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL format"
        case .invalidRequest:
            return "Invalid request"
        case .invalidResponse:
            return "Invalid response from server"
        case .decodingError(let msg):
            return "Decoding error: \(msg)"
        case .encodingError(let msg):
            return "Encoding error: \(msg)"
        case .serverError(let code, let msg):
            return "Server error \(code): \(msg)"
        case .clientError(let code, let msg):
            return "Client error \(code): \(msg)"
        case .networkError(let msg):
            return "Network error: \(msg)"
        case .timeout:
            return "Request timeout"
        case .noData:
            return "No data received"
        case .cancelled:
            return "Request cancelled"
        case .pinnedCertificateMismatch:
            return "Server certificate mismatch"
        case .unsupportedMediaType:
            return "Unsupported media type"
        case .malformedJSON:
            return "Malformed JSON response"
        case .unknownError(let msg):
            return "Unknown error: \(msg)"
        }
    }
}
