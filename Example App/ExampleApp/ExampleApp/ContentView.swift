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
            
            Button("Test Basic Connection") {
                Task {
                    await testBasicConnection()
                }
            }
            .padding()
            
            Button("Test API Endpoint") {
                Task {
                    await runExample()
                }
            }
            .padding()
        }
        .task {
            await testBasicConnection()
        }
    }
    
    func testBasicConnection() async {
        await MainActor.run { status = "Testing basic connection..." }
        
        // Test 1: Can we resolve DNS?
        guard let url = URL(string: "https://consent-bff-uat-commerce.uatjx.cosmote.gr") else {
            await MainActor.run { status = "❌ Invalid URL" }
            return
        }
        
        await MainActor.run { status = "✓ URL parsed correctly\nTesting reachability..." }
        
        // Test 2: Basic HTTP GET to check if server responds
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.timeoutInterval = 10
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                await MainActor.run {
                    status = """
                    ✅ Server is reachable!
                    Status: \(httpResponse.statusCode)
                    Data size: \(data.count) bytes
                    Headers: \(httpResponse.allHeaderFields)
                    
                    Ready to test API endpoint.
                    """
                }
            }
        } catch let error as URLError {
            await MainActor.run {
                status = """
                ❌ Connection Failed
                Error: \(error.localizedDescription)
                Code: \(error.code.rawValue)
                
                Common issues:
                - No internet connection
                - Server is down
                - Firewall/VPN blocking
                - DNS issues
                - Certificate problems
                """
            }
        } catch {
            await MainActor.run { status = "❌ Error: \(error.localizedDescription)" }
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
            baseURL: URL(string: "https://consent-bff-uat-commerce.uatjx.cosmote.gr"),
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
                flow: "flow",
                darkMode: false,
                redirectUrl: "https://example.com/redirect",
                fallbackUrl: nil,
                lang: "en",
                title: "Example",
                guid: "12345677868",
                attributes: [],
                steps: [],
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
