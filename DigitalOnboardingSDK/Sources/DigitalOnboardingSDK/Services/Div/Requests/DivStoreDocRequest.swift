//
//  DivStoreDocRequest.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

public struct DivStoreDocRequest: Encodable, BaseRequest {
    
    public let xRequestTrackingId: String?
    public let uuid: String?
    
    private let encodedDoc: String
    private let entityType: String
    private let mimeType: MimeType
    private let docId: String
    private let documentType: DocumentType
    private let errorCodes: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case encodedDoc, entityType, mimeType, docId, documentType, errorCodes
    }
    
    public init(
        xRequestTrackingId: String?,
        uuid: String?,
        encodedDoc: String,
        entityType: String,
        mimeType: MimeType,
        docId: String,
        documentType: DocumentType,
        errorCodes: [String]?
    ) {
        self.xRequestTrackingId = xRequestTrackingId
        self.uuid = uuid
        self.encodedDoc = encodedDoc
        self.entityType = entityType
        self.mimeType = mimeType
        self.docId = docId
        self.documentType = documentType
        self.errorCodes = errorCodes
    }
}
