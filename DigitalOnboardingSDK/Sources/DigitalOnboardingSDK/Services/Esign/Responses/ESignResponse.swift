//
//  ESignResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

public struct ESignResponse: Decodable {
    let redirectUrl: String?
    let uuid: String?
    let result: ResultType?
    
    private enum CodingKeys: String, CodingKey {
        case redirectUrl, uuid, result
    }
}
