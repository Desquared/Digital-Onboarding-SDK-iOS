//
//  DocumentUploadViewState.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import SwiftUI

/// ViewModel for DocumentUploadView
/// Bridges SwiftUI and VIPER Presenter
public class DocumentUploadViewState: ObservableObject {
    
    @Published var title: String = "Upload Document"
    @Published var stepTitle: String = "Step 1"
    @Published var currentStep: Int = 1
    @Published var totalSteps: Int = 1
    @Published var instructions: String = "Please capture a clear photo of your document"
    @Published var progress: Double = 0.0
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @Published var showSuccess: Bool = false
    @Published var successMessage: String = ""
    @Published var capturedImage: UIImage?
    @Published var showCaptureButton: Bool = true
    @Published var showRetryButton: Bool = false
    @Published var showContinueButton: Bool = false
    @Published var showImagePicker: Bool = false
    
    var onCaptureDocument: () -> Void = {}
    var onRetry: () -> Void = {}
    var onContinue: () -> Void = {}
    var onImageCaptured: (UIImage) -> Void = { _ in }
}
