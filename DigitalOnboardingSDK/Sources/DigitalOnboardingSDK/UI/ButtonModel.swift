//
//  ButtonModel.swift
//  DigitalOnboardingSDK
//
//  Created by George Roussos on 23/1/26.
//

import UIKit

public struct ButtonModel {
    let titleColor: UIColor
    let backgroundColor: UIColor
    let titleFont: UIFont
    let cornerRadius: CGFloat

    public init(
        titleColor: UIColor,
        backgroundColor: UIColor,
        titleFont: UIFont,
        cornerRadius: CGFloat
    ) {
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.titleFont = titleFont
        self.cornerRadius = cornerRadius
    }
}
