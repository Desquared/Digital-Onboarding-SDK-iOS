//
//  DivResultResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

public struct DivResultResponse: Decodable {
    private let result: ResultType
    private let documents: [DocumentModel]?
    private let metadata: [Metadata]?
    
    private enum CodingKeys: String, CodingKey {
        case result, documents, metadata
    }
}
