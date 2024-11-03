//
//  BaseResponse.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let message: String
    let data: T?
}
