//
//  NotificationType.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Foundation

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return "liked one of your posts."
        case .comment: return "commented on one of your posts"
        case .follow: return "started following you."
        }
    }
}
