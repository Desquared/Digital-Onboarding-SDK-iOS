//
//  UIButtonExtensions.swift
//  DigitalOnboardingSDK
//
//  Created by George Roussos on 23/1/26.
//

import Foundation
import UIKit

extension UIButton {

    func setTitleForAllStates(_ text: String?) {
        for state: UIControl.State in [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved] {
            self.setTitle(text, for: state)
        }
    }

    func setImageForAllStates(_ image: UIImage?) {
        for state: UIControl.State in [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved] {
            self.setImage(image, for: state)
        }
    }

    func setImage(_ image: UIImage?, forStates states: [UIControl.State]) {
        for state in states {
            self.setImage(image, for: state)
        }
    }

    func setTitleColorForAllStates(_ color: UIColor) {
        for state: UIControl.State in [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved] {
            self.setTitleColor(color, for: state)
        }
    }

    func setTitleColor(_ color: UIColor, forStates states: [UIControl.State]) {
        for state in states {
            self.setTitleColor(color, for: state)
        }
    }
}

