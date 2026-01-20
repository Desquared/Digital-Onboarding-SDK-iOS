import UIKit

/// Main entry point for the Digital Onboarding SDK
/// Provides methods to start identity verification and document signing flows
public final class DigitalOnboardingSDK {
    
    private let divServicesProvider: DivServicesProvider
    private let eSignServicesProvider: ESignServicesProvider
    private let uiConfig: UIConfig
    private let environment: EnvironmentType
    
    /// Initialize the SDK
    /// - Parameters:
    ///   - divServicesProvider: Optional custom DIV services provider (uses default if nil)
    ///   - eSignServicesProvider: Optional custom eSign services provider (uses default if nil)
    ///   - uiConfig: UI configuration for theming
    ///   - environment: Environment type (default: production)
    public init(
        divServicesProvider: DivServicesProvider? = nil,
        eSignServicesProvider: ESignServicesProvider? = nil,
        uiConfig: UIConfig,
        environment: EnvironmentType = .production
    ) {
        // Use provided or create default providers
        if let divProvider = divServicesProvider {
            self.divServicesProvider = divProvider
        } else {
            // Create default DIV provider with environment-based config
            let baseURL = environment.baseURL
            let config = URLConfigurationModel(baseURL: baseURL)
            let client = RestApiClient(configuration: config)
            self.divServicesProvider = DefaultDivServicesProvider(client: client)
        }
        
        if let eSignProvider = eSignServicesProvider {
            self.eSignServicesProvider = eSignProvider
        } else {
            // Create default eSign provider with environment-based config
            let baseURL = environment.baseURL
            let config = URLConfigurationModel(baseURL: baseURL)
            let client = RestApiClient(configuration: config)
            self.eSignServicesProvider = DefaultESignProvider(client: client)
        }
        
        self.uiConfig = uiConfig
        self.environment = environment
    }
    
    // MARK: - DIV Flow
    
    /// Start the DIV  flow by registering and obtaining a UUID
    /// - Parameters:
    ///   - channel: The channel through which the registration is performed
    ///   - orderId: The order identifier
    ///   - flow: The flow type for the registration
    ///   - darkMode: A boolean indicating if dark mode is enabled
    ///   - redirectUrl: The URL to redirect to after registration
    ///   - fallbackUrl: An optional fallback URL in case of failure
    ///   - lang: The language code for the registration process
    ///   - title: The title for the registration page
    ///   - guid: An optional globally unique identifier for the user
    ///   - attributes: A list of attributes to be included in the registration
    ///   - steps: A list of steps involved in the registration process
    ///   - metadata: A list of metadata items associated with the user
    /// - Returns: The registration response containing UUID and redirect URL
    /// - Throws: Network or API errors
    public func startDIVFlow(
        channel: String,
        orderId: String,
        flow: FlowEnum,
        darkMode: Bool,
        redirectUrl: String,
        fallbackUrl: String? = nil,
        lang: String,
        title: String,
        guid: String? = nil,
        attributes: [Attribute] = [],
        steps: [Step] = [],
        metadata: [Metadata] = []
    ) async throws -> DivRegisterResponse {
        
        // Register and get UUID
        let registerResponse = try await divServicesProvider.performRegister(
            channel: channel,
            orderId: orderId,
            flow: flow,
            lang: lang,
            guid: guid,
            attributes: attributes,
            metadata: metadata
        )
        
        return registerResponse
    }
    
    /// Start a document upload session with navigation controller
    /// Use this after calling startDIVFlow to present the document upload UI
    /// - Parameters:
    ///   - uuid: The session UUID obtained from startDIVFlow
    ///   - onCompletion: Optional callback when flow completes
    /// - Returns: A navigation controller with the document upload flow
    public func startSession(
        uuid: String,
        onCompletion: (() -> Void)? = nil
    ) -> UINavigationController {
        
        let builder = DocumentUploadBuilder(
            divServicesProvider: divServicesProvider,
            uuid: uuid,
            uiConfig: uiConfig,
            onCompletion: onCompletion
        )
        
        let navigationController = UINavigationController(rootViewController: builder.build())
        return navigationController
    }
}
