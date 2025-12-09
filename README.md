# Digital-Onboarding-SDK-iOS

SDK provides identity verification and e-sign document flows for iOS apps. It integrates with backend services to:

- Capture and upload identity artifacts to DM (Document Management)
- Run DIV typedetect and verify workflows asynchronously
- Display and accept documents for digital signature via CMP through an e-sign BFF
- Return structured results to the host app

## Features

- Document capture and upload to DM with minimal client-side persistence
- Asynchronous typedetect and verify with polling and timeouts
- Selfie capture and verification step
- E-sign document preview and acceptance
- Pluggable ServiceProvider for network stack
- Dynamic UI configuration per host product
- Observability headers and correlation IDs throughout requests

## Requirements

- iOS 16.0+
- Xcode 15+
- Swift 5.9+
