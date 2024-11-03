//
//  UserAPI.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation
import Moya

enum UserAPI {
    case register(request: RegisterUserRequest)
}

extension UserAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .register:
            return "/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .register:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .register(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .register:
            return nil
        }
    }
}
