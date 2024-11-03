//
//  RegisterUserResponse.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation

struct RegisterUserResponse: Decodable {
    let id: Int
    let username: String
    let businessDataId: Int
    let createdAt: Date
}
