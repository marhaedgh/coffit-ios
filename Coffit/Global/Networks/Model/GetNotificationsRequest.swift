//
//  GetNotificationsRequest.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation

struct GetNotificationsRequest: Codable {
    let userId: Int
    let businessDataId: Int
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case businessDataId = "business_data_id"
    }
}