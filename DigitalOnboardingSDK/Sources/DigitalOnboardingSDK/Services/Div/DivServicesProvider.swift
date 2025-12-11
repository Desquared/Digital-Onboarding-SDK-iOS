//
//  DivServicesProvider.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 9/12/25.
//

public protocol DivServicesProvider {
    func performRegister(
        channel: String,
        orderId: String,
        flow: String,
        darkMode: Bool,
        redirectUrl: String,
        fallbackUrl: String?,
        lang: String,
        title: String,
        guid: String?,
        attributes: [Attribute],
        steps: [Step],
        metadata: [Metadata]
    ) async throws -> DivRegisterResponse

    func performStoreDocument(
        uuid: String,
        encodedDocument: String,
        entityType: String,
        mimeType: MimeType,
        docId: String,
        documentType: DocumentType,
        errorCodes: [String]?
    ) async throws -> DivStoreResponse
}
