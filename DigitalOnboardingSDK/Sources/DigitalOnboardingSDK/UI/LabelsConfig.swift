//
//  LabelsConfig.swift
//  DigitalOnboardingSDK
//
//  Created by George Roussos on 23/1/26.
//

import UIKit

public struct LabelsConfig {
    let bodyMediumRegular: UIFont
    let subheading_3: UIFont
    
    public init(
        bodyMediumRegular: UIFont,
        subheading_3: UIFont
    ) {
        self.bodyMediumRegular = bodyMediumRegular
        self.subheading_3 = subheading_3
    }
}
