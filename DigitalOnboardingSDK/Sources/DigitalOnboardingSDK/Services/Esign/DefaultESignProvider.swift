//
//  DefaultESignProvider.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

class DefaultESignProvider: ESignServicesProvider {
    private let client: RestApiClient
    
    init(client: RestApiClient) {
        self.client = client
    }
    
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
    ) async throws -> ESignRegisterResponse {
        let requestBody = RegisterRequest(
            channel: channel,
            orderId: orderId,
            flow: flow,
            darkMode: darkMode,
            redirectUrl: redirectUrl,
            fallbackUrl: fallbackUrl,
            lang: lang,
            title: title,
            guid: guid,
            attributes: attributes,
            steps: steps,
            metadata: metadata
        )
        
        let request = Request<ESignRegisterResponse>(
            method: .POST,
            endpoint: "/esign/register",
            body: requestBody,
            baseRequest: requestBody
        )
        
        return try await client.send(request)
    }
    
    func performValidate(uuid: String) async throws -> ValidateResponse {
        let request = Request<ValidateResponse>(
            method: .GET,
            endpoint: "/esign/validate",
            body: nil,
            baseRequest: BaseRequestImpl(uuid: uuid)
        )
        
        return try await client.send(request)
    }
    
    func getDocumentById(docId: String, uuid: String) async throws -> DocumentResponse {
        let request = Request<DocumentResponse>(
            method: .GET,
            endpoint: "/esign/document/download/" + docId,
            baseRequest: BaseRequestImpl(uuid: uuid)
        )
        
        return try await client.send(request)
    }
    
    func getAllDocuments(uuid: String) async throws -> DocumentResponse {
        let request = Request<DocumentResponse>(
            method: .GET,
            endpoint: "/esign/document/download/all",
            baseRequest: BaseRequestImpl(uuid: uuid)
        )
         
        return try await client.send(request)
    }
}
