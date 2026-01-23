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
    let contentEdgeInsets: UIEdgeInsets
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let borderColor: CGColor?
    let image: UIImage?

    public init(
        titleColor: UIColor,
        backgroundColor: UIColor,
        titleFont: UIFont,
        contentEdgeInsets: UIEdgeInsets,
        cornerRadius: CGFloat,
        borderWidth: CGFloat,
        borderColor: CGColor? = nil,
        image: UIImage? = nil
    ) {
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.titleFont = titleFont
        self.contentEdgeInsets = contentEdgeInsets
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.image = image
    }
}
