//
//  Step.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

public struct Step: Codable {
    public let title: String
    public let active: Bool
    public let order: Int

    public init(title: String, active: Bool, order: Int) {
        self.title = title
        self.active = active
        self.order = order
    }
}
