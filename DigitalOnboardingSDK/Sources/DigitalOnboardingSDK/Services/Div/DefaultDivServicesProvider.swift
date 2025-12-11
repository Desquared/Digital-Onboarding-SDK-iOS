//
//  DivRestClient.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public final class DefaultDivServicesProvider: DivServicesProvider {
    private let client: RestApiClient
    
    public init(client: RestApiClient) {
        self.client = client
    }
    
    public func performRegister(
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
        metadata: [Metadata],
        xRequestTrackingId: String?
    ) async throws -> DivRegisterResponse {
        let requestBody = DivRegisterRequest(
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
            metadata: metadata,
            xRequestTrackingId: xRequestTrackingId,
            uuid: nil
        )
        
        let request = Request<DivRegisterResponse>(
            method: .POST,
            endpoint: "/v1/register",
            body: requestBody,
            baseRequest: requestBody
        )
        
        return try await client.send(request)
     }
}
