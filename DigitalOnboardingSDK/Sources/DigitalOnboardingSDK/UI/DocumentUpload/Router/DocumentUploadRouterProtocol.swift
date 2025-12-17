//
//  DocumentUploadRouterProtocol.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import UIKit

/// Protocol for the Document Upload Router
/// Handles navigation and screen transitions
public protocol DocumentUploadRouterProtocol: AnyObject {
    
    /// Navigate to next screen in the flow
    func navigateToNext()
    
    /// Navigate back to previous screen
    func navigateBack()
    
    /// Show document capture screen
    /// - Parameter documentType: The type of document to capture
    func showDocumentCapture(for documentType: DocumentType, completion: @escaping (UIImage?) -> Void)
    
    /// Dismiss current module
    func dismiss()
}
