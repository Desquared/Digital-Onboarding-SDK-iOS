//
//  UIConfig.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 9/12/25.
//

import SwiftUI

/// Configuration for customizing the UI appearance of the SDK.
/// Allows host apps to provide custom colors, fonts, icons, styling, and custom header views.
public struct UIConfig {
    
    /// Color model for theming
    public let colorModel: ColorModel
    
    /// Font model for typography
    public let fontModel: FontModel
    
    /// Icons model for custom icons
    public let iconsModel: IconsModel
    
    /// Small corner radius for UI elements
    public let radiusSmall: CGFloat
    
    /// Custom header provider (optional, uses default header if nil)
    public let customHeader: (any SDKHeaderProtocol)
    
    /// Initialize UI configuration
    /// - Parameters:
    ///   - colorModel: Custom color model
    ///   - fontModel: Custom font model
    ///   - iconsModel: Custom icons model
    ///   - radiusSmall: Corner radius for small UI elements
    ///   - customHeader: Custom header implementation
    public init(
        colorModel: ColorModel,
        fontModel: FontModel,
        iconsModel: IconsModel,
        radiusSmall: CGFloat,
        customHeader: (any SDKHeaderProtocol)
    ) {
        self.colorModel = colorModel
        self.fontModel = fontModel
        self.iconsModel = iconsModel
        self.radiusSmall = radiusSmall
        self.customHeader = customHeader
    }
}
