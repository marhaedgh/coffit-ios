//
//  NotificationAPI.swift
//  Coffit
//
//  Created by danna.x-PC on 11/4/24.
//

import Foundation
import Moya

enum NotificationAPI {
    case getNotifications(request: GetNotificationsRequest)
    case getNotification(id: Int)
}

extension NotificationAPI: BaseTargetType {
    var path: String {
        switch self {
        case .getNotifications:
            return "/notification/"
        case .getNotification(let id):
            return "/notification/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNotifications, .getNotification:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getNotifications(let request):
//            return .requestParameters(
//                parameters: [
//                    "user_id": request.userId,
//                    "business_data_id": request.businessDataId
//                ],
//                encoding: URLEncoding.default
//            )
            return .requestPlain
        case .getNotification:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getNotifications, .getNotification:
            return nil
        }
    }
}
