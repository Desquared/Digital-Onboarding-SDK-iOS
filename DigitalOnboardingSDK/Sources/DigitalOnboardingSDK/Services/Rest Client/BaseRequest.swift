// filepath: /Users/magoulas/Documents/Development/iOS/DIV SDK/DigitalOnboardingSDK/Sources/DigitalOnboardingSDK/Services/Rest Client/BaseRequest.swift
//
//  BaseRequest.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

import Foundation

public protocol BaseRequest {
    var xRequestTrackingId: String? { get }
    var uuid: String? { get }
}
