//
//  DocumentUploadView.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import SwiftUI
import VisionKit

/// SwiftUI View for Document Upload
/// Displays the document upload UI and handles user interactions
struct DocumentUploadView: View {
    
    @ObservedObject var viewModel: DocumentUploadViewState
    let uiConfig: UIConfig
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                // Header
                uiConfig.customHeader.makeHeader(
                    title: viewModel.title,
                    stepTitle: viewModel.stepTitle,
                    currentStep: viewModel.currentStep,
                    totalSteps: viewModel.totalSteps
                )
                
                ScrollView {
                    mainContent
                        .padding()
                }
            }
            
//            // Loading overlay
//            if viewModel.isLoading {
//                Color.black.opacity(0.3)
//                    .edgesIgnoringSafeArea(.all)
//                
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle(tint: uiConfig.colorModel.primaryProductColor))
//                    .scaleEffect(1.5)
//            }
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
        .alert("Success", isPresented: $viewModel.showSuccess) {
            Button("OK", role: .cancel) {
                viewModel.onContinue()
            }
        } message: {
            Text(viewModel.successMessage)
        }
        .fullScreenCover(isPresented: $viewModel.showDocumentScanner) {
            if #available(iOS 13.0, *) {
                DocumentScannerView(
                    onDocumentScanned: { image in
                        viewModel.onImageCaptured(image)
                    },
                    onCancel: {
                        viewModel.showDocumentScanner = false
                    }
                )
            }
        }
    }
    
    @ViewBuilder
    private var mainContent: some View {
        VStack(spacing: 24) {
            // Instructions
            Text(viewModel.instructions)
                .font(uiConfig.fontModel.bodyMRegular)
                .foregroundColor(uiConfig.colorModel.textColorOnBg)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            // Document preview or placeholder
            if let capturedImage = viewModel.capturedImage {
                VStack(spacing: 16) {
                    Image(uiImage: capturedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                        .cornerRadius(uiConfig.radiusSmall)
                        .overlay(
                            RoundedRectangle(cornerRadius: uiConfig.radiusSmall)
                                .stroke(uiConfig.colorModel.primaryProductColor, lineWidth: 2)
                        )
                    
                    Text("Document captured successfully")
                        .font(uiConfig.fontModel.bodyMRegular)
                        .foregroundColor(uiConfig.colorModel.primaryProductColor)
                }
            } else {
                documentPlaceholder
            }
            
            Spacer(minLength: 20)
            
            // Action buttons
            actionButtons
        }
    }
    
    private var documentPlaceholder: some View {
        VStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: uiConfig.radiusSmall)
                    .fill(uiConfig.colorModel.backgroundColor)
                    .frame(height: 250)
                    .overlay(
                        RoundedRectangle(cornerRadius: uiConfig.radiusSmall)
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
                            .foregroundColor(uiConfig.colorModel.dividerColor)
                    )
                
                VStack(spacing: 12) {
                    uiConfig.iconsModel.fileIcon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(uiConfig.colorModel.dividerColor)
                    
                    Text("No document captured yet")
                        .font(uiConfig.fontModel.bodyMRegular)
                        .foregroundColor(uiConfig.colorModel.textColorOnBg.opacity(0.6))
                }
            }
        }
    }
    
    @ViewBuilder
    private var actionButtons: some View {
        VStack(spacing: 12) {
            // Capture/Scan button
            if viewModel.showCaptureButton {
                Button(action: {
                    viewModel.showDocumentScanner = true
                    viewModel.onCaptureDocument()
                }) {
                    HStack {
                        Image(systemName: "camera.fill")
                        Text(viewModel.capturedImage == nil ? "Scan Document" : "Retake Photo")
                    }
                    .font(uiConfig.fontModel.buttonL)
                    .foregroundColor(uiConfig.colorModel.primaryButtonTextColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(uiConfig.colorModel.primaryButtonColor)
                    .cornerRadius(uiConfig.radiusSmall)
                }
            }
            
            // Continue button (only show if document captured)
            if viewModel.showContinueButton && viewModel.capturedImage != nil {
                Button(action: {
                    viewModel.onContinue()
                }) {
                    Text("Continue")
                        .font(uiConfig.fontModel.buttonL)
                        .foregroundColor(uiConfig.colorModel.primaryButtonTextColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(uiConfig.colorModel.primaryButtonColor)
                        .cornerRadius(uiConfig.radiusSmall)
                }
            }
            
            // Retry button (on error)
            if viewModel.showRetryButton {
                Button(action: {
                    viewModel.onRetry()
                }) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Retry Upload")
                    }
                    .font(uiConfig.fontModel.buttonL)
                    .foregroundColor(uiConfig.colorModel.secondaryButtonTextColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(uiConfig.colorModel.secondaryButtonColor)
                    .cornerRadius(uiConfig.radiusSmall)
                }
            }
        }
        .padding(.bottom)
    }
    //            ScrollView {
    //                VStack(spacing: 24) {
    //                    // Custom or Default Header
    //                    if let customHeader = uiConfig.customHeader {
    //                        customHeader.makeHeader(
    //                            title: viewModel.title,
    //                            stepTitle: viewModel.stepTitle,
    //                            currentStep: viewModel.currentStep,
    //                            totalSteps: viewModel.totalSteps
    //                        )
    //                    }
    //                }
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
    //        }
    //        .navigationBarTitleDisplayMode(.inline)
    //        .navigationBarBackButtonHidden(false)
    //        .alert("Error", isPresented: $viewModel.showError) {
    //            Button("OK", role: .cancel) { }
    //        } message: {
    //            Text(viewModel.errorMessage)
    //        }
    //        .alert("Success", isPresented: $viewModel.showSuccess) {
    //            Button("OK", role: .cancel) { }
    //        } message: {
    //            Text(viewModel.successMessage)
    //        }
    //        .sheet(isPresented: $viewModel.showImagePicker) {
    //            ImagePicker(image: $viewModel.capturedImage, onImagePicked: { image in
    //                if let image = image {
    //                    viewModel.onImageCaptured(image)
    //                }
    //            })
    //        }
    //    }
    //}
}


