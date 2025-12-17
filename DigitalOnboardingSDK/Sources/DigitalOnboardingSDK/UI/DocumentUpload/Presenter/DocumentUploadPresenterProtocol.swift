//
//  DocumentUploadPresenterProtocol.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import UIKit

/// Protocol for the Document Upload Presenter
/// Handles presentation logic and user actions
public protocol DocumentUploadPresenterProtocol: AnyObject {
    
    /// Called when view is loaded
    func viewDidLoad()
    
    /// Called when user taps capture document button
    func didTapCaptureDocument()
    
    /// Called when document image is captured
    /// - Parameter image: The captured document image
    func didCaptureDocument(_ image: UIImage)
    
    /// Called when user wants to retry capture
    func didTapRetry()
    
    /// Called when user wants to continue to next step
    func didTapContinue()
    
    /// Called when user wants to go back
    func didTapBack()
}
