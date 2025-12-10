//
//  DivRegisterRequest.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public struct DivRegisterRequest: Codable, BaseRequest {
    public let channel: String
    public let orderId: String
    public let flow: String
    public let darkMode: Bool
    public let redirectUrl: String
    public let fallbackUrl: String?
    public let lang: String
    public let title: String
    public let guid: String?
    public let attributes: [Attribute]
    public let steps: [Step]
    public let metadata: [Metadata]

    public let xRequestTrackingId: String?
    public let uuid: String?

    public init(channel: String, orderId: String, flow: String, darkMode: Bool, redirectUrl: String, fallbackUrl: String?, lang: String, title: String, guid: String?, attributes: [Attribute], steps: [Step], metadata: [Metadata], xRequestTrackingId: String?, uuid: String?) {
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
