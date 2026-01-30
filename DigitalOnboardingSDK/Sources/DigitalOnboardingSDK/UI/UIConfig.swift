//
//  UIConfig.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 9/12/25.
//

import UIKit

public struct UIConfig {
    let buttonsConfig: ButtonsConfig
    let typographyConfig: TypographyConfig
    let colorsConfig: ColorsConfig
    let cornerRadiusConfig: CornerRadiusConfig
    
    public init(
        buttonsConfig: ButtonsConfig,
        typographyConfig: TypographyConfig,
        colorsConfig: ColorsConfig,
        cornerRadiusConfig: CornerRadiusConfig
    ) {
        self.buttonsConfig = buttonsConfig
        self.typographyConfig = typographyConfig
        self.colorsConfig = colorsConfig
        self.cornerRadiusConfig = cornerRadiusConfig
    }
}
