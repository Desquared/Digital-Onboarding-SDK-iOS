# DIVEsignSDK

iOS Swift Package for DIVEsign document capture SDK.

## Installation

In Xcode: **File → Add Package Dependencies**

Enter: `https://github.com/Desquared/Digital-Onboarding-SDK-iOS.git`

## Usage

```swift
import SwiftUI
import DIVEsignSDK

@main
struct MyApp: App {
    init() {
        // Initialize Koin dependency injection
        Common_iosKt.startKoinLib()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

## Current Version

**0.0.5**
