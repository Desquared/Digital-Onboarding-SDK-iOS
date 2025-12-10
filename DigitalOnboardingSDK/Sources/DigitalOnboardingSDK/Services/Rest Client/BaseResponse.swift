//
//  BaseResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public struct BaseResponse {
    public let statusCode: Int
    public let data: Data?
    public let error: Error?
    
    public init(statusCode: Int, data: Data?, error: Error?) {
        self.statusCode = statusCode
        self.data = data
        self.error = error
    }
}
