//
//  ValidateResponse.swift
//  DigitalOnboardingSDK
//
//  Created by Christos Magoulas on 11/12/25.
//

import Foundation

public struct ValidateResponse: Decodable {
    
    let steps: [Step]?
    let title: String?
    
    private enum CodingKeys: String, CodingKey {
        case steps, title
    }
}
