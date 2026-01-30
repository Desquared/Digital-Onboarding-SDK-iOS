//
//  CornerRadiusConfig.swift
//  DigitalOnboardingSDK
//
//  Created by George Roussos on 30/1/26.
//

import Foundation

public struct CornerRadiusConfig {
    let small: CGFloat
    let medium: CGFloat
    let large: CGFloat
    
    public init(
        small: CGFloat,
        medium: CGFloat,
        large: CGFloat
    ) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}
