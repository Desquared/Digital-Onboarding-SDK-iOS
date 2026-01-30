//
//  TypographyConfig.swift
//  DigitalOnboardingSDK
//
//  Created by George Roussos on 23/1/26.
//

import UIKit

public struct TypographyConfig {
    let heading_5: UIFont
    let subheading_3: UIFont
    let bodyRegular: UIFont
    let bodySmall: UIFont
    let assistiveTextBold: UIFont
    
    public init(
        heading_5: UIFont,
        subheading_3: UIFont,
        bodyRegular: UIFont,
        bodySmall: UIFont,
        assistiveTextBold: UIFont
    ) {
        self.heading_5 = heading_5
        self.subheading_3 = subheading_3
        self.bodyRegular = bodyRegular
        self.bodySmall = bodySmall
        self.assistiveTextBold = assistiveTextBold
    }
}
