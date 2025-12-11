//
//  DivRegisterRequest.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public struct DivRegisterRequest: Encodable, BaseRequest {
    private let channel: String
    private let orderId: String
    private let flow: String
    private let darkMode: Bool
    private let redirectUrl: String
    private let fallbackUrl: String?
    private let lang: String
    private let title: String
    private let guid: String?
    private let attributes: [Attribute]
    private let steps: [Step]
    private let metadata: [Metadata]

    public let xRequestTrackingId: String?
    public let uuid: String?

    private enum CodingKeys: String, CodingKey {
        case channel, orderId, flow, darkMode, redirectUrl, fallbackUrl, lang, title, guid, attributes, steps, metadata
    }

    public init(
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
        xRequestTrackingId: String?,
        uuid: String? = nil
    ) {
        self.channel = channel
        self.orderId = orderId
        self.flow = flow
        self.darkMode = darkMode
        self.redirectUrl = redirectUrl
        self.fallbackUrl = fallbackUrl
        self.lang = lang
        self.title = title
        self.guid = guid
        self.attributes = attributes
        self.steps = steps
        self.metadata = metadata
        self.xRequestTrackingId = xRequestTrackingId
        self.uuid = uuid
    }
}
