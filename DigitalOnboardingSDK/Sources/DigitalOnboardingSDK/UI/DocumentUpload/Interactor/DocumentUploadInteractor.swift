//
//  DocumentUploadInteractor.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import UIKit

/// Interactor for Document Upload Module
/// Handles business logic and coordinates with service providers
public final class DocumentUploadInteractor: DocumentUploadInteractorProtocol {
    
    // MARK: - Properties
    
    private let divServicesProvider: DivServicesProvider
    private let uuid: String
    
    // MARK: - Initialization
    
    /// Initialize the interactor
    /// - Parameters:
    ///   - divServicesProvider: The DIV services provider
    ///   - uuid: The session UUID
    public init(divServicesProvider: DivServicesProvider, uuid: String) {
        self.divServicesProvider = divServicesProvider
        self.uuid = uuid
    }
    
    // MARK: - DocumentUploadInteractorProtocol
    
    /// Upload document to server
    /// - Parameters:
    ///   - image: The document image to upload
    ///   - documentType: The type of document
    ///   - docId: The document identifier
    /// - Returns: The store response with updated steps and documents
    /// - Throws: Network or encoding errors
    public func uploadDocument(image: UIImage, documentType: DocumentType, docId: String) async throws -> DivStoreResponse {
        // Convert image to base64
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            throw DocumentUploadError.imageConversionFailed
        }
        
        let base64String = imageData.base64EncodedString()
        
        // Upload document
        return try await divServicesProvider.performStoreDocument(
            uuid: uuid,
            encodedDocument: base64String,
            entityType: "DOCUMENT",
            mimeType: .imageJpeg,
            docId: docId,
            documentType: documentType,
            errorCodes: nil
        )
    }
    
    /// Verify uploaded documents
    /// - Returns: Verification response with document status
    /// - Throws: Network errors
    public func verifyDocuments() async throws -> DivVerifyDocumentResponse {
        return try await divServicesProvider.performVerifyDocument(uuid: uuid)
    }
    
    /// Reset current step
    /// - Returns: Response with reset step information
    /// - Throws: Network errors
    public func resetStep() async throws -> DivVerifyDocumentResponse {
        return try await divServicesProvider.performStepReset(uuid: uuid)
    }
    
    /// Get current step information
    /// - Returns: Response with current step details
    /// - Throws: Network errors
    public func getCurrentStep() async throws -> DivVerifyDocumentResponse {
        return try await divServicesProvider.performDocumentStepRetrieve(uuid: uuid)
    }
}

// MARK: - Errors

/// Errors that can occur during document upload
public enum DocumentUploadError: Error, LocalizedError {
    case imageConversionFailed
    case uploadFailed
    case verificationFailed
    case invalidResponse
    
    public var errorDescription: String? {
        switch self {
        case .imageConversionFailed:
            return "Failed to convert image to required format"
        case .uploadFailed:
            return "Failed to upload document"
        case .verificationFailed:
            return "Failed to verify document"
        case .invalidResponse:
            return "Received invalid response from server"
        }
    }
}
