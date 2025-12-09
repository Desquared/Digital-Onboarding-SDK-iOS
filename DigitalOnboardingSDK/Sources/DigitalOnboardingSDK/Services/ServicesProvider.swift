//
//  ServicesProvider.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 9/12/25.
//

public final class ServicesProvider {
    
    private let divServices: DivServicesProvider
    private let eSignServices: ESignServicesProvider
    
    init(divServices: DivServicesProvider, eSignServices: ESignServicesProvider) {
        self.divServices = divServices
        self.eSignServices = eSignServices
    }
}
