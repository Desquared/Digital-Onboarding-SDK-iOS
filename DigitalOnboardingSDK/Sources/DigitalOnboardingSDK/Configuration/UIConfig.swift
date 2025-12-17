//
//  UIConfig.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 9/12/25.
//

import UIKit

/// Configuration for customizing the UI appearance of the SDK.
/// Allows host apps to provide custom colors, fonts, and styling.
public struct UIConfig {
    public let colorModel: ColorModel
    public let fontModel: FontModel
    public let iconsModel: IconsModel
    public let radiusSmall: CFloat
}
