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
    let regionCity: String
    let regionDistrict: String
    let representativeBirthday: String
    let representativeGender: String
    let revenue: Float
    let employees: Int
    
    enum CodingKeys: String, CodingKey {
        case industry, revenue, employees
        case businessType = "business_type"
        case corporationType = "corporation_type"
        case regionCity = "region_city"
        case regionDistrict = "region_district"
        case representativeBirthday = "representative_birthday"
        case representativeGender = "representative_gender"
    }
}
