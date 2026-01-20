//
//  DocumentUploadViewProtocol.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import UIKit

/// Protocol for the Document Upload View
/// Handles UI updates and user interactions
public protocol DocumentUploadViewProtocol: AnyObject {
    
    /// Display loading state
    /// - Parameter isLoading: True to show loading, false to hide
    func showLoading(_ isLoading: Bool)
    
    /// Display error message
    /// - Parameter message: The error message to display
    func showError(_ message: String)
    
    /// Update UI with current step information
    /// - Parameter step: The current step in the flow
    func updateStep(_ step: Step)
    
    /// Show document scanner modal
    /// - Parameter documentType: The type of document to capture
    func showDocumentScanner(for documentType: DocumentType)
    
    /// Show success message for uploaded document
    /// - Parameter message: Success message to display
    func showSuccess(_ message: String)
    
    func updatePlaceholderImage(_ image: UIImage)
    
    /// Navigate to next screen
    func navigateToNext()
    
    /// Update progress indicator
    /// - Parameters:
    ///   - current: Current step number
    ///   - total: Total number of steps
    func updateProgress(current: Int, total: Int)
}
