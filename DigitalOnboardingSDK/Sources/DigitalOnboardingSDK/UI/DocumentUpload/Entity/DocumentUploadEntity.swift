//
//  DocumentUploadEntity.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//


/// Entity representing the document upload state
public struct DocumentUploadEntity {
    
    /// The UUID for the current session
    public let uuid: String
    
    /// Current document type being processed
    public var currentDocumentType: DocumentType
    
    /// Current document ID
    public var currentDocId: String
    
    /// List of uploaded documents
    public var uploadedDocuments: [DocumentModel]
    
    /// Current step in the flow
    public var currentStep: Step?
    
    /// Total number of steps
    public let totalSteps: Int
    
    /// Current step number
    public var currentStepNumber: Int
    
    public init(
        uuid: String,
        currentDocumentType: DocumentType = .unknown,
        currentDocId: String = "",
        uploadedDocuments: [DocumentModel] = [],
        currentStep: Step? = nil,
        totalSteps: Int = 5,
        currentStepNumber: Int = 1
    ) {
        self.uuid = uuid
        self.currentDocumentType = currentDocumentType
        self.currentDocId = currentDocId
        self.uploadedDocuments = uploadedDocuments
        self.currentStep = currentStep
        self.totalSteps = totalSteps
        self.currentStepNumber = currentStepNumber
    }
}