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
        metadata: [Metadata],
        xRequestTrackingId: String?
    ) async throws -> DivRegisterResponse
}
