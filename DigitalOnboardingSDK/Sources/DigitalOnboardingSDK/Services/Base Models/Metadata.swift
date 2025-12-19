//
//  Metadata.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 10/12/25.
//

///  A structure representing metadata with a name and value.
///  For name, consider using the `MetadataName` enum for predefined metadata names.
public struct Metadata: Codable {
    private let name: String
    private let value: String

    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}

public enum MetadataName: String, Codable {
    case firstName = "firstName"
    case lastName = "lastName"
    case idNumber = "idNumber"
    case birthDate = "birthDate" // DD/MM/YYYY
    case fathersName = "fathersName"
}
