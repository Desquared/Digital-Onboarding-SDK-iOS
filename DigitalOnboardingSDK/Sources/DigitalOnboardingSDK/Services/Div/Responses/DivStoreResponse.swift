//
//  DivStoreResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

public struct DivStoreResponse: Decodable {
    private let step: Step?
    private let documents: [DocumentModel]?
    
    private enum CodingKeys: String, CodingKey {
        case step, documents
    }
    
    public init(step: Step?, documents: [DocumentModel]?) {
        self.step = step
        self.documents = documents
    }
}
