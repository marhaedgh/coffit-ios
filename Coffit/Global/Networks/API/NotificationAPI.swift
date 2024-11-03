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
    case getRegiNotifications(request: GetNotificationsRequest)
    case getNotification(id: Int)
}

extension NotificationAPI: BaseTargetType {
    var path: String {
        switch self {
        case .getNotifications:
            return "/"
        case .getRegiNotifications:
            return "/regi"
        case .getNotification(let id):
            return "/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNotifications, .getRegiNotifications, .getNotification:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getNotifications(let request), .getRegiNotifications(let request):
            return .requestParameters(
                parameters: [
                    "user_id": request.userId,
                    "business_data_id": request.businessDataId
                ],
                encoding: URLEncoding.queryString
            )
        case .getNotification:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getNotifications, .getRegiNotifications, .getNotification:
            return nil
        }
    }
}
