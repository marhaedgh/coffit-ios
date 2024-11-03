//
//  RegisterUserResponse.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation

struct RegisterUserResponse: Decodable {
    let id: Int
    let businessDataId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case businessDataId = "business_data_id"
    }
}