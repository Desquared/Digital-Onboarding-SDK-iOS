//
//  DocumentUploadView.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import SwiftUI

/// SwiftUI View for Document Upload
/// Displays the document upload UI and handles user interactions
struct DocumentUploadView: View {
    
    @ObservedObject var viewModel: DocumentUploadViewState
    let uiConfig: UIConfig
    
    var body: some View {
        ZStack {
//            ScrollView {
//                VStack(spacing: 24) {
//                    // Progress Bar
//                    ProgressView(value: viewModel.progress)
//                        .tint(Color(uiConfig.colorModel.primaryProductColor))
//                        .padding(.horizontal)
//                    
//                    // Title
//                    Text(viewModel.title)
//                        .font(Font(uiConfig.titleFont))
//                        .foregroundColor(Color(uiConfig.textColor))
//                        .multilineTextAlignment(.center)
//                        .padding(.horizontal)
//                    
//                    // Instructions
//                    Text(viewModel.instructions)
//                        .font(Font(uiConfig.bodyFont))
//                        .foregroundColor(Color(uiConfig.secondaryTextColor))
//                        .multilineTextAlignment(.center)
//                        .padding(.horizontal)
//                    
//                    // Document Preview
//                    if let capturedImage = viewModel.capturedImage {
//                        Image(uiImage: capturedImage)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: 200)
//                            .cornerRadius(CGFloat(uiConfig.cornerRadius))
//                            .padding(.horizontal)
//                    } else {
//                        RoundedRectangle(cornerRadius: CGFloat(uiConfig.cornerRadius))
//                            .fill(Color(uiConfig.secondaryColor).opacity(0.1))
//                            .frame(height: 200)
//                            .overlay(
//                                VStack(spacing: 8) {
//                                    Image(systemName: "camera.fill")
//                                        .font(.system(size: 48))
//                                        .foregroundColor(Color(uiConfig.secondaryTextColor))
//                                    Text("No document captured")
//                                        .font(Font(uiConfig.captionFont))
//                                        .foregroundColor(Color(uiConfig.secondaryTextColor))
//                                }
//                            )
//                            .padding(.horizontal)
//                    }
//                    
//                    // Capture Button
//                    if viewModel.showCaptureButton {
//                        Button(action: {
//                            viewModel.onCaptureDocument()
//                        }) {
//                            Text("Capture Document")
//                                .font(Font(uiConfig.buttonFont))
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity)
//                                .frame(height: CGFloat(uiConfig.buttonHeight))
//                                .background(Color(uiConfig.primaryColor))
//                                .cornerRadius(CGFloat(uiConfig.cornerRadius))
//                        }
//                        .padding(.horizontal)
//                    }
//                    
//                    // Retry Button
//                    if viewModel.showRetryButton {
//                        Button(action: {
//                            viewModel.onRetry()
//                        }) {
//                            Text("Retry")
//                                .font(Font(uiConfig.buttonFont))
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity)
//                                .frame(height: CGFloat(uiConfig.buttonHeight))
//                                .background(Color(uiConfig.secondaryColor))
//                                .cornerRadius(CGFloat(uiConfig.cornerRadius))
//                        }
//                        .padding(.horizontal)
//                    }
//                    
//                    // Continue Button
//                    if viewModel.showContinueButton {
//                        Button(action: {
//                            viewModel.onContinue()
//                        }) {
//                            Text("Continue")
//                                .font(Font(uiConfig.buttonFont))
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity)
//                                .frame(height: CGFloat(uiConfig.buttonHeight))
//                                .background(Color(uiConfig.primaryColor))
//                                .cornerRadius(CGFloat(uiConfig.cornerRadius))
//                        }
//                        .padding(.horizontal)
//                    }
//                    
//                    Spacer()
//                }
//                .padding(.vertical)
//            }
//            .background(Color(uiConfig.backgroundColor))
//            
//            // Loading Overlay
//            if viewModel.isLoading {
//                Color.black.opacity(0.3)
//                    .ignoresSafeArea()
//                
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle(tint: Color(uiConfig.primaryColor)))
//                    .scaleEffect(1.5)
//            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
        .alert("Success", isPresented: $viewModel.showSuccess) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.successMessage)
        }
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(image: $viewModel.capturedImage, onImagePicked: { image in
                if let image = image {
                    viewModel.onImageCaptured(image)
                }
            })
        }
    }
}

/// Image Picker wrapper for SwiftUI
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    let onImagePicked: (UIImage?) -> Void
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No updates needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
                parent.onImagePicked(image)
            }
            parent.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.onImagePicked(nil)
            parent.dismiss()
        }
    }
}
