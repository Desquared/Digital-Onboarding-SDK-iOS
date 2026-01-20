//
//  DocumentUploadExampleView.swift
//  ExampleApp
//
//  Created by Christos Magoulas on 17/12/25.
//

import SwiftUI
import DigitalOnboardingSDK

/// Example view demonstrating how to use the Document Upload flow
struct DocumentUploadExampleView: View {
    @State private var status = "Ready to start DIV flow"
    @State private var showingSDK = false
    @State private var sdkViewController: UINavigationController?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("DIV Document Upload Example")
                .font(.title)
                .padding()
            
            Text(status)
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Start DIV Flow") {
                Task {
                    await startDIVFlow()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .sheet(isPresented: $showingSDK) {
            if let vc = sdkViewController {
                SDKViewControllerWrapper(viewController: vc)
            }
        }
    }
    
    func startDIVFlow() async {
        await MainActor.run { status = "Initializing DIV flow..." }
        let colorModel = ColorModel(backgroundColor: Color.black, primaryProductColor: Color.yellow, textColorOnBg: Color.white, primaryButtonColor: Color.yellow, primaryDisabledButtonColor: Color.gray, primaryButtonTextColor: Color.black, primaryDisabledButtonTextColor: Color.gray, ghostButtonColor: Color.cyan, ghostButtonTextColor: Color.blue, secondaryButtonColor: Color.gray, secondaryButtonTextColor: Color.red, dividerColor: Color.gray)
        
        // Create custom UI config (optional - uses defaults if not provided)
        let uiConfig = UIConfig(
            colorModel: colorModel,
            fontModel: FontModel(subtitleLarge: .subheadline, subtitleM: .title3, bodyMRegular: .body, buttonL: .largeTitle),
            iconsModel: IconsModel(errorIcon: Image.init("error"), failIcon: Image.init("error"), downloadButtonIcon: Image.init("error"), successIcon: Image.init("error"), fileIcon: Image.init("error")),
            radiusSmall: 8.0,
            customHeader: TestHeader()
        )
        
        // Initialize SDK with custom config
        let sdk = DigitalOnboardingSDK(
            divServicesProvider: nil,  // nil = use default
            eSignServicesProvider: nil, // nil = use default
            uiConfig: uiConfig,
            environment: .sit  // or .production, .uat
        )
        
        do {
//            // Step 1: Register and get UUID
//            await MainActor.run { status = "Registering session..." }
//            
//            let registerResponse = try await sdk.startDIVFlow(
//                channel: "OneApp",
//                orderId: "ORDER-\(UUID().uuidString.prefix(8))",
//                flow: "IDENTITY_VERIFICATION",
//                darkMode: false,
//                redirectUrl: "myapp://div/redirect",
//                fallbackUrl: "https://example.com/fallback",
//                lang: "el",
//                title: "Ταυτοποίηση",
//                guid: "12345657",
//                attributes: [
//                    Attribute(name: "customerType", value: "postpaid")
//                ],
//                steps: [
//                    Step(title: "Upload ID", active: true, order: 1),
//                    Step(title: "Verify", active: false, order: 2),
//                    Step(title: "Complete", active: false, order: 3)
//                ],
//                metadata: [
//                    Metadata(name: "msisdn", value: "+306912345678")
//                ]
//            )
//            
//            await MainActor.run {
//                status = "Session created with UUID: \(registerResponse.uuid)\nStarting document upload..."
//            }
            
            // Step 2: Start document upload session with the UUID
            let navController = sdk.startSession(
                uuid: "12341546",
                onCompletion: {
//                    Task {
//                        do {
//                            // Step 3: Get final result when flow completes
//                            let result = try await sdk.getDIVResult(uuid: registerResponse.uuid)
//                            await MainActor.run {
//                                status = "DIV flow completed successfully!"
//                                showingSDK = false
//                            }
//                            print("Final result:", result)
//                        } catch {
//                            await MainActor.run {
//                                status = "Error getting result: \(error.localizedDescription)"
//                                showingSDK = false
//                            }
//                            print("Error:", error)
//                        }
//                    }
                }
            )
            
            await MainActor.run {
                status = "Showing document upload UI..."
                sdkViewController = navController
                showingSDK = true
            }
            
        } catch {
            await MainActor.run {
                status = "Error: \(error.localizedDescription)"
            }
            print("Error starting DIV flow:", error)
        }
    }
}

struct TestHeader: SDKHeaderProtocol {
    func makeHeader(title: String, stepTitle: String, currentStep: Int, totalSteps: Int) -> AnyView {
        return AnyView(
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(stepTitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text("Step \(currentStep) of \(totalSteps)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
            }
            .padding()
            .background(Color(.systemBackground))
        )
    }
}

/// Wrapper to present UIViewController in SwiftUI
struct SDKViewControllerWrapper: UIViewControllerRepresentable {
    let viewController: UINavigationController
    
    func makeUIViewController(context: Context) -> UINavigationController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No updates needed
    }
}
