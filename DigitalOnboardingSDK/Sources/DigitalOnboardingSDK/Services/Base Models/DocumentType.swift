//
//  DocumentType.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

public enum DocumentType: String, Codable {
    case passport = "PASSPORT"
    case greekIdFront = "GREEK_ID_FRONT"
    case greekIdBack = "GREEK_ID_BACK"
    case selfie = "SELFIE"
    case unknown = "UNKNOWN"
}
