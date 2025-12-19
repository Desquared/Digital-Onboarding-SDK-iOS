//
//  DefaultDivServicesProvider.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

class DefaultDivServicesProvider: DivServicesProvider {
    private let client: RestApiClient
    
    init(client: RestApiClient) {
        self.client = client
    }
    
    func performRegister(
        channel: String,
        orderId: String,
        flow: FlowEnum,
        lang: String,
        guid: String?,
        attributes: [Attribute],
        metadata: [Metadata]
    ) async throws -> DivRegisterResponse {
        let requestBody = DivRegisterRequest(
            channel: channel,
            orderId: orderId,
            flow: flow.rawValue,
            lang: lang,
            guid: guid,
            attributes: attributes,
            metadata: metadata
        )
        
        let request = Request<DivRegisterResponse>(
            method: .POST,
            endpoint: "/v1/register",
            body: requestBody,
            baseRequest: requestBody
        )
        
        return try await client.send(request)
    }
    
    func performStoreDocument(
        uuid: String,
        encodedDocument: String,
        entityType: String,
        mimeType: MimeType,
        docId: String,
        documentType: DocumentType,
        errorCodes: [String]?
    ) async throws -> DivStoreResponse {
        let requestBody = DivStoreDocRequest(
            uuid: uuid,
            encodedDoc: encodedDocument,
            entityType: entityType,
            mimeType: mimeType,
            docId: docId,
            documentType: documentType,
            errorCodes: errorCodes
        )
        
        let request = Request<DivStoreResponse>(
            method: .POST,
            endpoint: "/storeDocument",
            body: requestBody,
            baseRequest: requestBody
        )
        
        return try await client.send(request)
    }
    
    func performValidate(uuid: String) async throws -> DivValidateResponse {
        let request = Request<DivValidateResponse>(
            method: .GET,
            endpoint: "/validate",
            body: nil,
            baseRequest: BaseRequestImpl(uuid: uuid)
        )
        
        return try await client.send(request)
    }
    
    func performVerifyDocument(uuid: String) async throws -> DivVerifyDocumentResponse {
        let request = Request<DivVerifyDocumentResponse>(
            method: .GET,
            endpoint: "/verifyDocument",
            body: nil,
            baseRequest: BaseRequestImpl(uuid: uuid)
        )
        return try await client.send(request)
    }
    
    func performStepReset(uuid: String) async throws -> DivVerifyDocumentResponse {
        let request = Request<DivVerifyDocumentResponse>(
            method: .GET,
            endpoint: "/documentStep/reset",
            body: nil,
            baseRequest: BaseRequestImpl(uuid: uuid)
        )
        return try await client.send(request)
    }
    
    func performDocumentStepRetrieve(uuid: String) async throws -> DivVerifyDocumentResponse {
        let request = Request<DivVerifyDocumentResponse>(
            method: .GET,
            endpoint: "/documentStep/retrieve",
            body: nil,
            baseRequest: BaseRequestImpl(uuid: uuid)
        )
        return try await client.send(request)
    }
    
    func performResult(uuid: String) async throws -> DivResultResponse {
        let request = Request<DivResultResponse>(
            method: .GET,
            endpoint: "/v1/result",
            body: nil,
            baseRequest: BaseRequestImpl(uuid: uuid)
        )
        return try await client.send(request)
    }
}
