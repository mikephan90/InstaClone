//
//  NotificationService.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Firebase

class NotificationService {
    
    func fetchNotifications() async throws -> [Notification] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await FirebaseConstants.UserNotificationsCollection(uid: currentUid).getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Notification.self) })
    }
    
    func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        
        let ref = FirebaseConstants.UserNotificationsCollection(uid: currentUid).document()
        
        let notification = Notification(
            id: ref.documentID,
            postId: post?.id,
            timestamp: Timestamp(),
            notificationSenderUid: currentUid,
            type: type
        )
        
        guard let notificationData = try? Firestore.Encoder().encode(notification) else { return }
        
        ref.setData(notificationData)
    }
    
    func deleteNotifications(toUid uid: String, type: NotificationType, post: Post? = nil) {
        
    }
    
}
