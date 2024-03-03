//
//  Constants.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Firebase

struct FirebaseConstants {
    static let Root = Firestore.firestore()
    
    static let UsersCollection = Root.collection("users")
    
    static let PostsCollection = Root.collection("posts")
    
    static let FollowingCollection = Root.collection("following")
    static let FollowersCollection = Root.collection("followers")
    
    static let NotificationCollection = Root.collection("notifications")
    
    // Function as we need an input parameter of uid
    static func UserNotificationsCollection(uid: String) -> CollectionReference {
        return NotificationCollection.document(uid).collection("user-notifications")
    }
}
