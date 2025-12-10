//
//  BaseResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public struct BaseResponse {
    private let statusCode: Int
    private let data: Data?
    private let error: Error?
    
    public init(statusCode: Int, data: Data?, error: Error?) {
        self.statusCode = statusCode
        self.data = data
        self.error = error
    }
}
