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
}
