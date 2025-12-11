//
//  RestApiClient.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

// Wrapper to make any Encodable work with JSONEncoder
private struct AnyEncodable: Encodable {
    let value: Encodable
    
    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}

public class RestApiClient {
    private lazy var session: URLSession = createSession()
    private let baseURL: URL?
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let headers: [String: String]
    private let configuration: URLConfigurationModel
    
    public init(configuration: URLConfigurationModel) {
        self.baseURL = configuration.baseURL
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
        self.headers = configuration.defaultHeaders
        self.configuration = configuration
    }
    
    public func send<T: Decodable>(_ request: Request<T>) async throws -> T {
        try await send(request) { data in try self.decode(data) }
    }
        
    public func send(_ request: Request<Void>) async throws {
        try await send(request) { _ in () }
    }

    private func send<T>(_ request: Request<T>,
                         _ decode: @escaping (Data) throws -> T) async throws -> T
    {
        let urlRequest = try await makeURLRequest(for: request)
        let (data, response) = try await send(urlRequest)
        try validate(response: response, data: data)
        return try decode(data)
    }

    // The final implementation uses a custom URLSession wrapper compatible with iOS 13.0
    private func send(_ request: URLRequest) async throws -> (Data, URLResponse) {
        try await session.data(for: request, delegate: nil)
    }
    
    private func makeURLRequest<T>(for request: Request<T>) async throws -> URLRequest {
        guard let baseURL = baseURL else {
            throw NetworkError.invalidURL
        }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        components.path = request.endpoint
        if let query = request.query {
            components.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        // Set default headers
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        // Set headers from baseRequest
        if let baseRequest = request.baseRequest {
            if let trackingId = baseRequest.xRequestTrackingId {
                urlRequest.setValue(trackingId, forHTTPHeaderField: "X-Request-Tracking-Id")
            }
            if let uuid = baseRequest.uuid {
                urlRequest.setValue(uuid, forHTTPHeaderField: "UUID")
            }
        }
        
        // Set body
        if let body = request.body {
            urlRequest.httpBody = try encoder.encode(AnyEncodable(value: body))
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        
        if urlRequest.value(forHTTPHeaderField: "Accept") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        
        return urlRequest
    }
    
    private func validate(response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return
        case 400...499:
            throw NetworkError.clientError(httpResponse.statusCode, String(data: data, encoding: .utf8) ?? "Client error")
        case 500...599:
            throw NetworkError.serverError(httpResponse.statusCode, String(data: data, encoding: .utf8) ?? "Server error")
        default:
            throw NetworkError.unknownError("Unexpected status code: \(httpResponse.statusCode)")
        }
    }
    
    private func decode<T: Decodable>(_ data: Data) throws -> T {
        try decoder.decode(T.self, from: data)
    }
}

extension RestApiClient {
    func createSession() -> URLSession {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = configuration.timeout
        config.timeoutIntervalForResource = configuration.resourceTimeout
        config.waitsForConnectivity = configuration.waitsForConnectivity
        config.allowsCellularAccess = configuration.allowsCellularAccess
        
        config.tlsMinimumSupportedProtocolVersion = .TLSv12
                
        // Caching
        let cache = URLCache(
            memoryCapacity: configuration.cacheMemoryMB * 1024 * 1024,
            diskCapacity: configuration.cacheDiskMB * 1024 * 1024,
            diskPath: "RestApiClientCache"
        )
        config.urlCache = cache
        config.requestCachePolicy = .useProtocolCachePolicy
        
        return URLSession(configuration: config)
    }
}
