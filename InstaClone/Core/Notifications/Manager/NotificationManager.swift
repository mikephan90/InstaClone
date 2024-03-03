//
//  NotificationManager.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Foundation

class NotificationManager {
    
    // Create a shared instance for this service as it is being called in multiple places in the application
    static let shared = NotificationManager()
    private let service = NotificationService()
    
    private init() {}
    
    func uploadLikeNotification(toUid uid: String, post: Post) {
        service.uploadNotification(toUid: uid, type: .like, post: post)
    }
    
    func uploadCommentNotification(toUid uid: String, post: Post) {
        service.uploadNotification(toUid: uid, type: .comment, post: post)
    }
    
    func uploadFollowNotification(toUid uid: String) {
        service.uploadNotification(toUid: uid, type: .follow)
    }
    
}
