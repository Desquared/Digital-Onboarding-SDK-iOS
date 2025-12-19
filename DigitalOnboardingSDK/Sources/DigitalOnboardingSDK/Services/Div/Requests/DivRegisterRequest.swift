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
    private let lang: String?
    private let guid: String?
    private let attributes: [Attribute]?
    private let metadata: [Metadata]

    public let xRequestTrackingId: String?
    public let uuid: String?

    private enum CodingKeys: String, CodingKey {
        case channel, orderId, flow, guid, attributes, metadata
    }

    public init(
        channel: String,
        orderId: String,
        flow: String,
        lang: String?,
        guid: String?,
        attributes: [Attribute]? = nil,
        metadata: [Metadata],
        xRequestTrackingId: String? = UUID().uuidString,
        uuid: String? = nil
    ) {
        self.channel = channel
        self.orderId = orderId
        self.flow = flow
        self.lang = lang
        self.guid = guid
        self.metadata = metadata
        self.attributes = attributes
        self.xRequestTrackingId = xRequestTrackingId
        self.uuid = uuid
    }
}
