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

    /// Initialize a step
    /// - Parameters:
    ///   - title: The title of the step
    ///   - active: Whether the step is currently active
    ///   - order: The order/position of the step
    public init(title: String, active: Bool, order: Int) {
        self.title = title
        self.active = active
        self.order = order
    }
}
