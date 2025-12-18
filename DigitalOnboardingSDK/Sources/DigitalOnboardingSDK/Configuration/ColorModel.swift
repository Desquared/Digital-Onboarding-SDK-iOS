//
//  ColorModel.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//
import SwiftUI

public struct ColorModel {
    let backgroundColor: Color
    let primaryProductColor: Color
    let textColorOnBg: Color
    let primaryButtonColor: Color
    let primaryDisabledButtonColor: Color
    let primaryButtonTextColor: Color
    let primaryDisabledButtonTextColor: Color
    let ghostButtonColor: Color
    let ghostButtonTextColor: Color
    let secondaryButtonColor: Color
    let secondaryButtonTextColor: Color
    let dividerColor: Color
    
    public init(backgroundColor: Color, primaryProductColor: Color, textColorOnBg: Color, primaryButtonColor: Color, primaryDisabledButtonColor: Color, primaryButtonTextColor: Color, primaryDisabledButtonTextColor: Color, ghostButtonColor: Color, ghostButtonTextColor: Color, secondaryButtonColor: Color, secondaryButtonTextColor: Color, dividerColor: Color) {
        self.backgroundColor = backgroundColor
        self.primaryProductColor = primaryProductColor
        self.textColorOnBg = textColorOnBg
        self.primaryButtonColor = primaryButtonColor
        self.primaryDisabledButtonColor = primaryDisabledButtonColor
        self.primaryButtonTextColor = primaryButtonTextColor
        self.primaryDisabledButtonTextColor = primaryDisabledButtonTextColor
        self.ghostButtonColor = ghostButtonColor
        self.ghostButtonTextColor = ghostButtonTextColor
        self.secondaryButtonColor = secondaryButtonColor
        self.secondaryButtonTextColor = secondaryButtonTextColor
        self.dividerColor = dividerColor
    }
}
