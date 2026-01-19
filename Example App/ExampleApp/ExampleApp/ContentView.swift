//
//  ContentView.swift
//  ExampleApp
//
//  Created by Christos Magoulas on 11/12/25.
//

import SwiftUI
import DigitalOnboardingSDK

struct ContentView: View {
    @State private var status = "Starting..."

    var body: some View {
        VStack {
            Text(status)
                .padding()
            
            Button("Test API Endpoint") {
                Task {
                    await runExample()
                }
            }
            .padding()
        }
    }

    func runExample() async {
        await MainActor.run { status = "Testing API endpoint with logging..." }
        
        // Create a logger for debugging
        let logger = ConsoleRequestLogger(
            logLevel: .debug,
            includeBody: true,
            includeHeaders: true
        )
        
        let config = URLConfigurationModel(
            baseURL: URL(string: "https://consent-bff-sit-commerce.uatjx.cosmote.gr"),
            defaultHeaders: [:],
            timeout: 30,
            resourceTimeout: 60,
            cacheMemoryMB: 10,
            cacheDiskMB: 50,
            waitsForConnectivity: true,
            allowsCellularAccess: true,
            logger: logger
        )
        
        let client = RestApiClient(configuration: config)
        let provider = DefaultDivServicesProvider(client: client)

        do {
            let response = try await provider.performRegister(
                channel: "OneApp",
                orderId: "ORDER-\(UUID().uuidString)",
                flow: FlowEnum.youthPrepaidNew,
                lang: "en",
                guid: "12345677868",
                attributes: [],
                metadata: []
            )
            await MainActor.run {
                status = """
                ✅ Success!
                UUID: \(response.uuid)
                Redirect: \(response.redirectUrl)
                
                Check Xcode console for detailed request/response logs!
                """
            }
        } catch {
            await MainActor.run {
                status = """
                ❌ API Error: \(error.localizedDescription)
                
                Check Xcode console for detailed error logs!
                """
            }
        }
    }
}
