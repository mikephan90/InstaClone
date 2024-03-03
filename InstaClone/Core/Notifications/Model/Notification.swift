//
//  Notification.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Firebase

struct Notification: Identifiable, Codable {
    let id: String
    var postId: String? // Optional because its not just posts, can receive a follow
    let timestamp: Timestamp
    let notificationSenderUid: String
    let type: NotificationType
    
    var post: Post?
    var user: User?
}
