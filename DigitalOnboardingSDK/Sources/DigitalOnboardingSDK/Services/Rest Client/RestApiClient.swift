//
//  RestApiClient.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

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
    
    /// Sends an HTTP request and decodes the response into the specified type.
    /// Automatically handles request logging, response validation, and error logging.
    /// - Parameter request: The request to send, containing method, endpoint, query parameters, and body.
    /// - Returns: The decoded response of type T.
    /// - Throws: NetworkError if the request fails, response is invalid, or decoding fails.
    public func send<T: Decodable>(_ request: Request<T>) async throws -> T {
        try await send(request) { data in try self.decode(data) }
    }
    
    /// Sends an HTTP request that expects no response body (Void).
    /// Automatically handles request logging, response validation, and error logging.
    /// - Parameter request: The request to send, containing method, endpoint, query parameters, and body.
    /// - Throws: NetworkError if the request fails or response is invalid.
    public func send(_ request: Request<Void>) async throws {
        try await send(request) { _ in () }
    }

    /// Core send method that handles the complete request lifecycle.
    /// Generates a unique request ID, logs the request, sends it, validates the response,
    /// logs the response or error, and decodes the result.
    /// - Parameters:
    ///   - request: The request to send.
    ///   - decode: A closure that decodes the response data into the expected type.
    /// - Returns: The decoded response of type T.
    /// - Throws: NetworkError if any step of the request fails.
    private func send<T>(_ request: Request<T>,
                         _ decode: @escaping (Data) throws -> T) async throws -> T
    {
        let requestId = request.endpoint + "-" + (request.baseRequest?.xRequestTrackingId ?? "")
        let startTime = Date()
        let urlRequest = try await makeURLRequest(for: request)
        logRequest(
            logger: configuration.logger,
            request: urlRequest,
            startTime: startTime,
            requestId: requestId,
            endpoint: request.endpoint
        )
        
        do {
            let (data, response) = try await send(urlRequest)
            try validate(response: response, data: data)
            
            logResponse(
                logger: configuration.logger,
                response: response,
                requestId: requestId,
                data: data,
                startTime: startTime
            )
            
            return try decode(data)
        } catch {
            // Log error
            logError(
                logger: configuration.logger,
                requestId: requestId,
                error: error,
                startTime: startTime
            )
            throw error
        }
    }

    /// Executes the URLRequest using URLSession.
    /// This is a thin wrapper around URLSession.data that allows for easy testing and mocking.
    /// - Parameter request: The URLRequest to execute.
    /// - Returns: A tuple containing the response data and URLResponse.
    /// - Throws: URLError if the network request fails.
    private func send(_ request: URLRequest) async throws -> (Data, URLResponse) {
        try await session.data(for: request, delegate: nil)
    }
    
    /// Constructs a URLRequest from the generic Request object.
    /// Combines base URL with endpoint, adds query parameters, sets HTTP method,
    /// applies default headers, sets BaseRequest headers (X-Request-Tracking-Id, UUID),
    /// and encodes the request body as JSON.
    /// - Parameter request: The generic request object containing all request details.
    /// - Returns: A fully configured URLRequest ready to be sent.
    /// - Throws: NetworkError.invalidURL if the URL cannot be constructed.
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
        
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if let baseRequest = request.baseRequest {
            if let trackingId = baseRequest.xRequestTrackingId {
                urlRequest.setValue(trackingId, forHTTPHeaderField: "X-Request-Tracking-Id")
            }
            if let uuid = baseRequest.uuid {
                urlRequest.setValue(uuid, forHTTPHeaderField: "UUID")
            }
        }
        
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
    
    /// Validates the HTTP response status code and throws appropriate errors.
    /// - Parameters:
    ///   - response: The URLResponse to validate.
    ///   - data: The response data, used for error message extraction.
    /// - Throws: NetworkError.invalidResponse if response is not HTTPURLResponse,
    ///           NetworkError.clientError for 4xx status codes,
    ///           NetworkError.serverError for 5xx status codes,
    ///           NetworkError.unknownError for unexpected status codes.
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
    
    /// Decodes JSON data into the specified Decodable type.
    /// - Parameter data: The JSON data to decode.
    /// - Returns: The decoded object of type T.
    /// - Throws: DecodingError if the data cannot be decoded into type T.
    private func decode<T: Decodable>(_ data: Data) throws -> T {
        try decoder.decode(T.self, from: data)
    }
}

extension RestApiClient {
    /// Creates and configures a URLSession with the settings from the configuration model.
    /// Sets up timeout intervals, connectivity options, TLS security, and caching policies.
    /// - Returns: A configured URLSession instance ready for network requests.
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
