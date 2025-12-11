//
//  DivVerifyDocumentResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

public struct DivVerifyDocumentResponse: Decodable {
    public let step: Step?
    public let documents: [DocumentModel]?
    
    private enum CodingKeys: String, CodingKey {
        case step, documents
    }
}
