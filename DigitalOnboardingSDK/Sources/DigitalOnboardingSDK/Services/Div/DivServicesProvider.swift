//
//  DivServicesProvider.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 9/12/25.
//

public protocol DivServicesProvider {
    
    /// Initialize DIV registration and obtain redirect URL and UUID.
    /// Used to kick off the identity flow in the SDK.
    /// Track and persist UUID for subsequent calls.
    /// - Parameters:
    ///  - channel: The channel through which the registration is performed.
    ///  - orderId: The order identifier.
    ///  - flow: The flow type for the registration.
    ///  - lang: The language code for the registration process.
    ///  - guid: An optional globally unique identifier for the user from CosmoteID.
    ///  - attributes: A list of attributes to be included in the registration.
    ///  - metadata: A list of metadata items associated with the user.
    func performRegister(
        channel: String,
        orderId: String,
        flow: FlowEnum,
        lang: String,
        guid: String?,
        attributes: [Attribute],
        metadata: [Metadata]
    ) async throws -> DivRegisterResponse

    /// Upload a document to DIV for processing.
    /// Minimal variant may include only step: "waiting".
    /// Use after Register and before Verify Document.
    /// - Parameters:
    /// - uuid: The UUID obtained from the registration step.
    /// - encodedDocument: The base64 encoded document to be uploaded.
    /// - entityType: The type of entity
    /// - mimeType: The MIME type of the document.
    /// - docId: The document identifier.
    /// - documentType: The type of document being uploaded.
    /// - errorCodes: An optional list of error codes associated with the document.
    func performStoreDocument(
        uuid: String,
        encodedDocument: String,
        entityType: String,
        mimeType: MimeType,
        docId: String,
        documentType: DocumentType,
        errorCodes: [String]?
    ) async throws -> DivStoreResponse
    
    /// Fetches current flow steps and titles for client UI.
    /// Use to render progress UI and enable/disable actions by step.
    /// - Parameters:
    /// - uuid: The UUID obtained from the registration step.
    func performValidate(uuid: String) async throws -> DivValidateResponse
    
    /// Checks verification status of uploaded documents.
    /// Needs time for verification. Possible polling or websocket
    /// Handle partial errors per document (e.g., back side failed).
    /// - Parameters:
    /// - uuid: The UUID obtained from the registration step.
    func performVerifyDocument(uuid: String) async throws -> DivVerifyDocumentResponse
    
    /// Reset the document capture step.
    /// Use when user restarts capture or to recover from error states.
    ///  - Parameters:
    ///  - uuid: The UUID obtained from the registration step.
    func performStepReset(uuid: String) async throws -> DivVerifyDocumentResponse
    
    /// Retrieve the current document capture step from DIV.
    /// Use to drive capture UI and error surfaces.
    /// - Parameters:
    /// - uuid: The UUID obtained from the registration step.
    func performDocumentStepRetrieve(uuid: String) async throws -> DivVerifyDocumentResponse
    
    /// Retrieve overall DIV flow result and optional artifacts/metadata.
    /// Call after completion events to finalize flow and collect outputs.
    /// - Parameters:
    /// - uuid: The UUID obtained from the registration step.
    func performResult(uuid: String) async throws -> DivResultResponse
}
