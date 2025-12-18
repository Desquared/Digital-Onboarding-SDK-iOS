//
//  FontModel.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//


import SwiftUI

public struct FontModel {
    let subtitleLarge: Font
    let subtitleM: Font
    let bodyMRegular: Font
    let buttonL: Font
    
    public init(subtitleLarge: Font, subtitleM: Font, bodyMRegular: Font, buttonL: Font) {
        self.subtitleLarge = subtitleLarge
        self.subtitleM = subtitleM
        self.bodyMRegular = bodyMRegular
        self.buttonL = buttonL
    }
}
