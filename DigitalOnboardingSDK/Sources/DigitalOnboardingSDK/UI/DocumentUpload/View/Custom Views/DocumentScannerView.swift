//
//  DocumentScannerView.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 18/12/25.
//

import SwiftUI
import VisionKit

/// SwiftUI wrapper for VNDocumentCameraViewController
/// Apple's built-in document scanner with automatic edge detection
@available(iOS 13.0, *)
struct DocumentScannerView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    var onDocumentScanned: (UIImage) -> Void
    var onCancel: () -> Void
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = context.coordinator
        return scanner
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        // No updates needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        let parent: DocumentScannerView
        
        init(_ parent: DocumentScannerView) {
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            // Get the first scanned page
            if scan.pageCount > 0 {
                let image = scan.imageOfPage(at: 0)
                parent.onDocumentScanned(image)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            parent.onCancel()
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("Document scanner failed with error: \(error)")
            parent.onCancel()
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
