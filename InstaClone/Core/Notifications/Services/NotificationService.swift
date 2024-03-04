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
        let snapshot = try await FirebaseConstants.UserNotificationsCollection(uid: currentUid)
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Notification.self) })
    }
    
    func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        
        let ref = FirebaseConstants.UserNotificationsCollection(uid: uid).document()
        
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
    
    func deleteNotifications(toUid uid: String, type: NotificationType, post: Post? = nil) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        
        let snapshot = try await FirebaseConstants.UserNotificationsCollection(uid: uid)
            .whereField("notificationSenderUid", isEqualTo: currentUid)
            .getDocuments()
        
        let notifications = snapshot.documents.compactMap({ try? $0.data(as: Notification.self) })
    
        // Filter down by type then post
        let filteredByType = notifications.filter({ $0.type == type}) // get all notifications by type
        
        if type == .follow {
            for notification in filteredByType {
                try await FirebaseConstants.UserNotificationsCollection(uid: uid)
                    .document(notification.id)
                    .delete()
            }
        } else {
            guard let notificationToDelete = filteredByType.first(where: { $0.postId == post?.id }) else { return }
            // get notifications for that post, review this as you could have multiple comments on the post
            
            try await FirebaseConstants.UserNotificationsCollection(uid: uid)
                .document(notificationToDelete.id)
                .delete()
        }
    }
    
}
