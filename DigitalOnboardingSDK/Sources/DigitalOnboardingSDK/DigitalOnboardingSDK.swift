public final class DivSDK {
    
    private let serviceProvider: ServicesProtocol
    private let uiConfig: UIConfig
    
    init(serviceProvider: ServicesProtocol, uiConfig: UIConfig) {
        self.serviceProvider = serviceProvider
        self.uiConfig = uiConfig
    }
    
}
