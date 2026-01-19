//
//  DivStoreResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public struct DivStoreResponse: Decodable {
    
    let step: Step?
    let documents: [DocumentModel]?
    
    private enum CodingKeys: String, CodingKey {
        case step, documents
    }
}
