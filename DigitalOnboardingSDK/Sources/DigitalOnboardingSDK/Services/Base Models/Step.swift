//
//  Step.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

public struct Step: Codable {
    private let title: String
    private let active: Bool
    private let order: Int

    public init(title: String, active: Bool, order: Int) {
        self.title = title
        self.active = active
        self.order = order
    }
}
