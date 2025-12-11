public final class DigitalOnboardingSDK {
    
    private let servicesProvider: ServicesProvider
    private let uiConfig: UIConfig
    private let environment: EnvironmentType
    
    init(
        servicesProvider: ServicesProvider,
        uiConfig: UIConfig,
        environment: EnvironmentType = .production
    ) {
        self.servicesProvider = servicesProvider
        self.uiConfig = uiConfig
        self.environment = environment
    }
    
}
