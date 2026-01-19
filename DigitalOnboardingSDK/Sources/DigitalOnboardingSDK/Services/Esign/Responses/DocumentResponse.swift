//
//  DocumentResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 12/12/25.
//

import Foundation

public struct DocumentResponse: Decodable {
    let encodedDoc: String
    let name: String?
    let docId: String
    let type: DocumentType?
    
    private enum CodingKeys: String, CodingKey {
        case encodedDoc, name, docId, type
    }
}
