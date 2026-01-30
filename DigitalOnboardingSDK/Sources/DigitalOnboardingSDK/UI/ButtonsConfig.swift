//
//  ButtonsConfig.swift
//  DigitalOnboardingSDK
//
//  Created by George Roussos on 23/1/26.
//

import UIKit

public struct ButtonsConfig {
    let primaryButton: ButtonModel
    let tertiaryButton: ButtonModel
    let disabledButton: ButtonModel
    
    public init(
        primaryButton: ButtonModel,
        tertiaryButton: ButtonModel,
        disabledButton: ButtonModel
    ) {
        self.primaryButton = primaryButton
        self.tertiaryButton = tertiaryButton
        self.disabledButton = disabledButton
    }
}
