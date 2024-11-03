//
//  BaseTargetType.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType {
    
}

extension BaseTargetType {
    var baseURL: URL {
        guard let url = URL(string: Bundle.baseURL) else {
            fatalError("🚨Base URL을 찾을 수 없습니다🚨")
        }
        return url
    }
}
