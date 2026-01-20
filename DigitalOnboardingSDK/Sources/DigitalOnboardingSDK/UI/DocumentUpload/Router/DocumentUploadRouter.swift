//
//  DocumentUploadRouter.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import UIKit

/// Router for Document Upload Module
/// Handles navigation and screen transitions
public final class DocumentUploadRouter: DocumentUploadRouterProtocol {
    
    // MARK: - Properties
    
    private weak var viewController: UIViewController?
    private let onCompletion: (() -> Void)?
    
    // MARK: - Initialization
    
    /// Initialize the router
    /// - Parameters:
    ///   - viewController: The view controller to route from (works with both UIKit and SwiftUI hosting controller)
    ///   - onCompletion: Callback when flow completes
    public init(viewController: UIViewController?, onCompletion: (() -> Void)? = nil) {
        self.viewController = viewController
        self.onCompletion = onCompletion
    }
    
    // MARK: - DocumentUploadRouterProtocol
    
    /// Navigate to next screen in the flow
    public func navigateToNext() {
        onCompletion?()
    }
    
    /// Navigate back to previous screen
    public func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    /// Show document capture screen
    /// - Parameters:
    ///   - documentType: The type of document to capture
    ///   - completion: Callback with captured image
    public func showDocumentCapture(for documentType: DocumentType, completion: @escaping (UIImage?) -> Void) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = DocumentCaptureDelegate(completion: completion)
        
        viewController?.present(imagePicker, animated: true)
    }
    
    /// Dismiss current module
    public func dismiss() {
        viewController?.dismiss(animated: true)
    }
}

// MARK: - Document Capture Delegate

/// Helper class to handle image picker delegate callbacks
private class DocumentCaptureDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let completion: (UIImage?) -> Void
    
    init(completion: @escaping (UIImage?) -> Void) {
        self.completion = completion
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        picker.dismiss(animated: true) {
            self.completion(image)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) {
            self.completion(nil)
        }
    }
}
