//
//  UIConfig.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 9/12/25.
//

import UIKit

public struct UIConfig {
    let buttonsConfig: ButtonsConfig
    let labelsConfig: LabelsConfig
    let screenColorsConfig: ScreenColorsConfig
    let genericRadius: CGFloat
    
    public init (
        buttonsConfig: ButtonsConfig,
        labelsConfig: LabelsConfig,
        screenColorsConfig: ScreenColorsConfig,
        genericRadius: CGFloat
    ) {
        self.buttonsConfig = buttonsConfig
        self.labelsConfig = labelsConfig
        self.screenColorsConfig = screenColors
        self.genericRadius = genericRadius
    }
}
