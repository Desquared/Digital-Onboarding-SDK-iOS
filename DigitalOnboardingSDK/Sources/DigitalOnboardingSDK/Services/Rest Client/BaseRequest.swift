// filepath: /Users/magoulas/Documents/Development/iOS/DIV SDK/DigitalOnboardingSDK/Sources/DigitalOnboardingSDK/Services/Rest Client/BaseRequest.swift
//
//  BaseRequest.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public protocol BaseRequest {
    var xRequestTrackingId: String? { get }
    var uuid: String? { get }
}

public struct Request<Response> {
    public let method: HTTPMethod
    public let endpoint: String
    public let query: [String: String]?
    public let body: Encodable?
    public let baseRequest: BaseRequest?
    
    public init(method: HTTPMethod, endpoint: String, query: [String: String]? = nil, body: Encodable? = nil, baseRequest: BaseRequest? = nil) {
        self.method = method
        self.endpoint = endpoint
        self.query = query
        self.body = body
        self.baseRequest = baseRequest
    }
}
