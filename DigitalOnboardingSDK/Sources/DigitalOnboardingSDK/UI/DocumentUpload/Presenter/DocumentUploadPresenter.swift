//
//  DocumentUploadPresenter.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import UIKit

/// Presenter for Document Upload Module
/// Handles presentation logic and coordinates between View and Interactor
public final class DocumentUploadPresenter: DocumentUploadPresenterProtocol {
    
    // MARK: - Properties
    
    private weak var view: DocumentUploadViewProtocol?
    private let interactor: DocumentUploadInteractorProtocol
    private let router: DocumentUploadRouterProtocol
    private var entity: DocumentUploadEntity
    
    // MARK: - Initialization
    
    /// Initialize the presenter
    /// - Parameters:
    ///   - view: The view to present to
    ///   - interactor: The interactor for business logic
    ///   - router: The router for navigation
    ///   - entity: The entity containing state
    public init(
        view: DocumentUploadViewProtocol,
        interactor: DocumentUploadInteractorProtocol,
        router: DocumentUploadRouterProtocol,
        entity: DocumentUploadEntity
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.entity = entity
    }
    
    // MARK: - DocumentUploadPresenterProtocol
    
    /// Called when view is loaded
    public func viewDidLoad() {
        // Update progress
        view?.updateProgress(current: entity.currentStepNumber, total: entity.totalSteps)
        
        // Load current step
        Task {
            await loadCurrentStep()
        }
    }
    
    /// Called when user taps capture document button
    public func didTapCaptureDocument() {
        router.showDocumentCapture(for: entity.currentDocumentType) { [weak self] image in
            guard let self = self, let image = image else { return }
            self.didCaptureDocument(image)
        }
    }
    
    /// Called when document image is captured
    /// - Parameter image: The captured document image
    public func didCaptureDocument(_ image: UIImage) {
        view?.updatePlaceholderImage(image)
    }
    
    /// Called when user wants to retry capture
    public func didTapRetry() {
        Task {
            do {
                view?.showLoading(true)
                _ = try await interactor.resetStep()
                view?.showLoading(false)
                didTapCaptureDocument()
            } catch {
                await handleError(error)
            }
        }
    }
    
    /// Called when user wants to continue to next step
    public func didTapContinue() {
        Task {
            do {
                view?.showLoading(true)
                let response = try await interactor.verifyDocuments()
                await handleVerificationResponse(response)
            } catch {
                await handleError(error)
            }
        }
    }
    
    /// Called when user wants to go back
    public func didTapBack() {
        router.navigateBack()
    }
    
    // MARK: - Private Methods
    
    /// Load current step information
    @MainActor
    private func loadCurrentStep() async {
        view?.showLoading(true)
        
        do {
            let response = try await interactor.getCurrentStep()
            
            if let step = response.step {
                entity.currentStep = step
                view?.updateStep(step)
            }
            
            view?.showLoading(false)
        } catch {
            await handleError(error)
        }
    }
    
    /// Handle upload response
    /// - Parameter response: The store response
    @MainActor
    private func handleUploadResponse(_ response: DivStoreResponse) async {
        view?.showLoading(false)
        
        // Update entity with uploaded documents
        if let documents = response.documents {
            entity.uploadedDocuments = documents
        }
        
        // Update step if provided
        if let step = response.step {
            entity.currentStep = step
            view?.updateStep(step)
        }
        
        // Check if we need to upload another side (e.g., back of ID)
        if let documents = response.documents, !documents.isEmpty {
            // If there are more documents to upload, show capture again
            view?.showSuccess("Document uploaded successfully")
            
            // Check if this was front side and we need back side
            if entity.currentDocId.contains("front") {
                entity.currentDocId = entity.currentDocId.replacingOccurrences(of: "front", with: "back")
                view?.showDocumentScanner(for: entity.currentDocumentType)
            } else {
                // All documents uploaded, ready to continue
                view?.showSuccess("All documents uploaded successfully")
            }
        }
    }
    
    /// Handle verification response
    /// - Parameter response: The verification response
    @MainActor
    private func handleVerificationResponse(_ response: DivVerifyDocumentResponse) async {
        view?.showLoading(false)
        
        if let step = response.step {
            entity.currentStep = step
            view?.updateStep(step)
        }
        
        // Check documents for errors
        if let documents = response.documents {
            let hasErrors = documents.contains { doc in
                // This would need proper error checking based on your DocumentModel
                false // Placeholder
            }
            
            if hasErrors {
                view?.showError("Some documents failed verification. Please retry.")
            } else {
                view?.showSuccess("Documents verified successfully")
                // Move to next step
                entity.currentStepNumber += 1
                view?.navigateToNext()
            }
        } else {
            view?.showSuccess("Documents verified successfully")
            entity.currentStepNumber += 1
            view?.navigateToNext()
        }
    }
    
    /// Handle error
    /// - Parameter error: The error to handle
    @MainActor
    private func handleError(_ error: Error) async {
        view?.showLoading(false)
        
        let message: String
        if let uploadError = error as? DocumentUploadError {
            message = uploadError.localizedDescription
        } else {
            message = "An error occurred: \(error.localizedDescription)"
        }
        
        view?.showError(message)
    }
}
