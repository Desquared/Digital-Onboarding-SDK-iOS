//
//  ColorsConfig.swift
//  DigitalOnboardingSDK
//
//  Created by George Roussos on 23/1/26.
//

import UIKit

public struct ColorsConfig {
    let background: UIColor
    let surface: UIColor
    let progressBarActiveColor: UIColor
    let esignProgressBarActiveColor: UIColor
    let progressBarInactiveColor: UIColor
    let errorColor: UIColor
    
    public init(
        background: UIColor,
        surface: UIColor,
        progressBarActiveColor: UIColor,
        esignProgressBarActiveColor: UIColor,
        progressBarInactiveColor: UIColor,
        errorColor: UIColor
    ) {
        self.background = background
        self.surface = surface
        self.progressBarActiveColor = progressBarActiveColor
        self.esignProgressBarActiveColor = esignProgressBarActiveColor
        self.progressBarInactiveColor = progressBarInactiveColor
        self.errorColor = errorColor
    }
}
