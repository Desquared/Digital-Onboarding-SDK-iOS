//
//  ESignServicesProvider.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 9/12/25.
//

public protocol ESignServicesProvider {
    
    /// Initialize ESign registration and obtain redirect URL and UUID.
    /// Store uuid and deep link user to redirectUrl.
    /// - Parameters:
    ///  - channel: The channel through which the registration is performed.
    ///  - orderId: The order identifier.
    ///  - flow: The flow type for the registration.
    ///  - darkMode: A boolean indicating if dark mode is enabled.
    ///  - redirectUrl: The URL to redirect to after registration.
    ///  - fallbackUrl: An optional fallback URL in case of failure.
    ///  - lang: The language code for the registration process.
    ///  - title: The title for the registration page.
    ///  - guid: An optional globally unique identifier for the user from CosmoteID.
    ///  - attributes: A list of attributes to be included in the registration.
    ///  - steps: A list of steps involved in the registration process.
    ///  - metadata: A list of metadata items associated with the user.
    func performRegister(
        channel: String,
        orderId: String,
        flow: String,
        darkMode: Bool,
        redirectUrl: String,
        fallbackUrl: String?,
        lang: String,
        title: String,
        guid: String?,
        attributes: [Attribute],
        steps: [Step],
        metadata: [Metadata]
    ) async throws -> ESignRegisterResponse
    
    /// Fetches current flow steps and titles for client UI.
    /// Use to render progress UI and enable/disable actions by step.
    /// - Parameters:
    /// - uuid: The UUID obtained from the registration step.
    func performValidate(uuid: String) async throws -> ValidateResponse
    
    /// Retrieves a document by its identifier for the given UUID.
    /// Decode base64 to present or store.
    /// - Parameters:
    /// - docId: The document identifier.
    /// - uuid: The UUID associated with the document.
    func getDocumentById(docId: String, uuid: String) async throws -> DocumentResponse
    
    /// Retrieves all documents associated with the given UUID.
    /// Backend may return a single compiled bundled PDF
    /// - Parameters:
    /// - uuid: The UUID associated with the documents.
    func getAllDocuments(uuid: String) async throws -> DocumentResponse
    
    /// Retrieve list of eSign documents available to the user.
    /// Use with preview or download endpoints.
    /// - Parameters:
    /// - uuid: The UUID associated with the documents.
    func performDocumentRetrieve(uuid: String) async throws -> [DocumentResponse]
    
    /// Accept the consent for eSign process for the given UUID.
    /// Trigger only from explicit user action and record consent locally.
    /// - Parameters:
    /// - uuid: The UUID associated with the consent.
    func acceptConsent(uuid: String) async throws -> Void
    
}

