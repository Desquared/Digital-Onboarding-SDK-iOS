//
//  DocumentUploadHostingController.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import UIKit
import SwiftUI

/// View Controller for Document Upload (SwiftUI Version)
/// Hosts SwiftUI view and bridges with VIPER Presenter
public final class DocumentUploadHostingController: UIViewController {
    
    // MARK: - Properties
    
    private var presenter: DocumentUploadPresenterProtocol!
    private let uiConfig: UIConfig
    private let viewModel: DocumentUploadViewState
    private var hostingController: UIHostingController<DocumentUploadView>?
    
    // MARK: - Initialization
    
    /// Initialize the view controller
    /// - Parameter uiConfig: Configuration for UI styling
    public init(uiConfig: UIConfig) {
        self.uiConfig = uiConfig
        self.viewModel = DocumentUploadViewState()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupSwiftUIView()
        setupViewModelCallbacks()
        presenter.viewDidLoad()
    }
    
    // MARK: - Setup
    
    /// Configure the presenter
    /// - Parameter presenter: The presenter to use
    public func configure(with presenter: DocumentUploadPresenterProtocol) {
        self.presenter = presenter
    }
    
    private func setupSwiftUIView() {
        let swiftUIView = DocumentUploadView(viewModel: viewModel, uiConfig: uiConfig)
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
        self.hostingController = hostingController
    }
    
    private func setupViewModelCallbacks() {
        viewModel.onCaptureDocument = { [weak self] in
            self?.viewModel.showImagePicker = true
        }
        
        viewModel.onRetry = { [weak self] in
            self?.presenter.didTapRetry()
        }
        
        viewModel.onContinue = { [weak self] in
            self?.presenter.didTapContinue()
        }
        
        viewModel.onImageCaptured = { [weak self] image in
            self?.presenter.didCaptureDocument(image)
        }
    }
}

// MARK: - DocumentUploadViewProtocol

extension DocumentUploadHostingController: DocumentUploadViewProtocol {
    
    public func updatePlaceholderImage(_ image: UIImage) {
        viewModel.capturedImage = image
    }
    
    
    public func showDocumentScanner(for documentType: DocumentType) {
        viewModel.isLoading = false
        viewModel.showCaptureButton = true
        viewModel.showRetryButton = true
        viewModel.showContinueButton = false
    }
    
    
    /// Display loading state
    /// - Parameter isLoading: True to show loading, false to hide
    public func showLoading(_ isLoading: Bool) {
        viewModel.isLoading = isLoading
    }
    
    /// Display error message
    /// - Parameter message: The error message to display
    public func showError(_ message: String) {
        viewModel.errorMessage = message
        viewModel.showError = true
    }
    
    /// Update UI with current step information
    /// - Parameter step: The current step in the flow
    public func updateStep(_ step: Step) {
        viewModel.title = step.title
        viewModel.instructions = "Please capture a clear photo of your document"
    }
    
    /// Show document capture interface
    /// - Parameter documentType: The type of document to capture
    public func showDocumentCapture(for documentType: DocumentType) {
        viewModel.showCaptureButton = true
        viewModel.showRetryButton = false
        viewModel.showContinueButton = false
    }
    
    /// Show success message for uploaded document
    /// - Parameter message: Success message to display
    public func showSuccess(_ message: String) {
        viewModel.successMessage = message
        viewModel.showSuccess = true
        viewModel.showCaptureButton = true
        viewModel.showRetryButton = false
        viewModel.showContinueButton = true
    }
    
    /// Navigate to next screen
    public func navigateToNext() {
        // Router will handle navigation
        navigationController?.popViewController(animated: true)
    }
    
    /// Update progress indicator
    /// - Parameters:
    ///   - current: Current step number
    ///   - total: Total number of steps
    public func updateProgress(current: Int, total: Int) {
        viewModel.currentStep = current
        viewModel.totalSteps = total
        viewModel.progress = Double(current) / Double(total)
    }
}
