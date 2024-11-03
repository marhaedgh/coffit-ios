//
//  RegisterUserRequest.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation

struct RegisterUserRequest: Encodable {
    let businessType: String
    let corporationType: String
    let industry: String
    // TODO: 추가
    
    enum CodingKeys: String, CodingKey {
        case businessType, corporationType, industry
    }
}
