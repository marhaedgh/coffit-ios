//
//  GetNotificationResponse.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation

struct GetNotificationResponse: Codable {
    let id: Int
    let title: String
    let summary: String
    let keywords: [String]?
    let whatToDo: String
    let date: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, summary, keywords, date, content
        case whatToDo = "whattodo"
    }
}
