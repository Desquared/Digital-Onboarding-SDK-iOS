//
//  ButtonsConfig.swift
//  DigitalOnboardingSDK
//
//  Created by George Roussos on 23/1/26.
//

import UIKit

public struct ButtonsConfig {
    let primaryButtonLargeNormal: ButtonModel
    let tertiaryButtonLargeNormal: ButtonModel
    
    public init(
        primaryButtonLargeNormal: ButtonModel,
        tertiaryButtonLargeNormal: ButtonModel
    ) {
        self.primaryButtonLargeNormal = primaryButtonLargeNormal
        self.tertiaryButtonLargeNormal = tertiaryButtonLargeNormal
    }
    
    public func setupButton(button: UIButton, config: ButtonModel) {
        button.setTitleColorForAllStates(config.titleColor)
        button.backgroundColor = config.backgroundColor
        button.titleLabel?.font = config.titleFont
        button.contentEdgeInsets = config.contentEdgeInsets
        button.layer.cornerRadius = config.cornerRadius
        button.layer.borderWidth = config.borderWidth
        button.layer.borderColor = config.borderColor
        button.setImageForAllStates(config.image)
    }
}
