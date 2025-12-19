//
//  DocumentModel.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

public struct DocumentModel: Codable {
    private let encodedDoc: String
    private let entityType: String
    private let mimeType: MimeType
    private let docId: String
    private let documentType: DocumentType
    private let errorCodes: [String]?
    
    public init(encodedDoc: String, entityType: String, mimeType: MimeType, docId: String, documentType: DocumentType, errorCodes: [String]?) {
        self.encodedDoc = encodedDoc
        self.entityType = entityType
        self.mimeType = mimeType
        self.docId = docId
        self.documentType = documentType
        self.errorCodes = errorCodes
    }
}
