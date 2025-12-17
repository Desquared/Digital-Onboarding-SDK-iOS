//
//  DocumentUploadInteractorProtocol.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import UIKit

/// Protocol for the Document Upload Interactor
/// Handles business logic and data operations
public protocol DocumentUploadInteractorProtocol: AnyObject {
    
    /// Upload document to server
    /// - Parameters:
    ///   - image: The document image to upload
    ///   - documentType: The type of document
    ///   - docId: The document identifier
    func uploadDocument(image: UIImage, documentType: DocumentType, docId: String) async throws -> DivStoreResponse
    
    /// Verify uploaded documents
    func verifyDocuments() async throws -> DivVerifyDocumentResponse
    
    /// Reset current step
    func resetStep() async throws -> DivVerifyDocumentResponse
    
    /// Get current step information
    func getCurrentStep() async throws -> DivVerifyDocumentResponse
}
