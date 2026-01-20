//
//  DocumentUploadBuilder.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import UIKit

/// Builder for Document Upload Module
/// Creates and configures all VIPER components
public final class DocumentUploadBuilder {
    
    private let divServicesProvider: DivServicesProvider
    private let uuid: String
    private let uiConfig: UIConfig
    private let onCompletion: (() -> Void)?
    
    /// - Parameters:
    ///   - divServicesProvider: The DIV services provider
    ///   - uuid: The session UUID
    ///   - uiConfig: UI configuration
    ///   - onCompletion: Callback when flow completes
    init(
        divServicesProvider: DivServicesProvider,
        uuid: String,
        uiConfig: UIConfig,
        onCompletion: (() -> Void)? = nil
    ) {
        self.divServicesProvider = divServicesProvider
        self.uuid = uuid
        self.uiConfig = uiConfig
        self.onCompletion = onCompletion
    }
    
    /// Build the document upload module
    /// - Returns: Configured view controller
    func build() -> UIViewController {
        let viewController = DocumentUploadHostingController(uiConfig: uiConfig)
        let entity = DocumentUploadEntity(uuid: uuid)
        let interactor = DocumentUploadInteractor(
            divServicesProvider: divServicesProvider,
            uuid: uuid
        )
        let router = DocumentUploadRouter(
            viewController: viewController,
            onCompletion: onCompletion
        )
        let presenter = DocumentUploadPresenter(
            view: viewController,
            interactor: interactor,
            router: router,
            entity: entity
        )
        
        viewController.configure(with: presenter)
        return viewController
    }
    
}
