//
//  PostService.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import Foundation
import Firebase

struct PostService {
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await FirebaseConstants.PostsCollection.order(by: "timestamp", descending: true).getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self )})
        
        // This will allow fetching of user info per post to correctly display the owners
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await FirebaseConstants.PostsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        let posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)} )
        return posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}

// MARK: - Likes

extension PostService {
    static func likePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // This for Firebase will create a new collection, "post-likes" and updates current post with +1 like
        // All async calls, don't want to wait for all the other calls to complete. 
        async let _ = try await FirebaseConstants.PostsCollection.document(post.id).collection("post-likes").document(uid).setData([:])
        async let _ = try await FirebaseConstants.PostsCollection.document(post.id).updateData(["likes":post.likes + 1])
        async let _ = FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).setData([:])
    }
    
    static func unlikePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // This for Firebase will create a new collection, "post-likes" and updates current post with +1 like
        // All async calls, don't want to wait for all the other calls to complete.
        // Store the current user's likes into a new collection
        async let _ = try await FirebaseConstants.PostsCollection.document(post.id).collection("post-likes").document(uid).delete()
        async let _ = try await FirebaseConstants.PostsCollection.document(post.id).updateData(["likes":post.likes - 1])
        async let _ = FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).delete()
    }
    
    static func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        
        // Checks and looks at the Firestore collection has a uid within the user's like
        let snapshot = try await FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).getDocument()
        return snapshot.exists
    }
}
