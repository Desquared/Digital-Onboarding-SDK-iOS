//
//  DocumentUploadHeaderProtocol.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import SwiftUI

/// Protocol for custom document upload header views
/// Host apps can implement this to provide their own header UI
public protocol DocumentUploadHeaderProtocol {
    
    /// Create the header view with current state
    /// - Parameters:
    ///   - title: The title to display
    ///   - stepTitle: The current step title
    ///   - currentStep: Current step number
    ///   - totalSteps: Total number of steps
    /// - Returns: A SwiftUI view for the header
    @ViewBuilder
    func makeHeader(
        title: String,
        stepTitle: String,
        currentStep: Int,
        totalSteps: Int
    ) -> AnyView
}
