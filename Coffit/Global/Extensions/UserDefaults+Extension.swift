//
//  UserDefaults+Extension.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation

enum UserDefaultKeys {
    static let USER_ID = "USER_ID"
    static let BUSINESS_ID = "BUSINESS_ID"
}

extension UserDefaults {
    static func setUserId(_ value: Int) {
        UserDefaults.standard.set(value, forKey: UserDefaultKeys.USER_ID)
    }
    
    static func getUserId() -> Int {
        UserDefaults.standard.integer(forKey: UserDefaultKeys.USER_ID)
    }
    
    static func setBusinessId(_ value: Int) {
        UserDefaults.standard.set(value, forKey: UserDefaultKeys.BUSINESS_ID)
    }
    
    static func getBusinessId() -> Int {
        UserDefaults.standard.integer(forKey: UserDefaultKeys.BUSINESS_ID)
    }
}
