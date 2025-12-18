//
//  IconsModel.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 17/12/25.
//

import SwiftUI

public struct IconsModel {
    let errorIcon: Image
    let failIcon: Image
    let downloadButtonIcon: Image
    let successIcon: Image
    let fileIcon: Image
    
    public init (errorIcon: Image, failIcon: Image, downloadButtonIcon: Image, successIcon: Image, fileIcon: Image) {
        self.errorIcon = errorIcon
        self.failIcon = failIcon
        self.downloadButtonIcon = downloadButtonIcon
        self.successIcon = successIcon
        self.fileIcon = fileIcon
    }
}
