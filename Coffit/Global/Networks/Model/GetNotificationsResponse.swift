//
//  GetNotificationsResponse.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation

struct GetNotificationsResponse: Decodable {
    let id: Int
    let title: String
    let lineSummary: String
    let keywords: [String]?
    let date: String
    let isRead: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case lineSummary = "line_summary"
        case keywords
        case date
        case isRead = "is_read"
    }
}
