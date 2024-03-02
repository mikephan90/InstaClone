//
//  PostService.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import Foundation
import Firebase

struct PostService {
    
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.order(by: "timestamp", descending: true).getDocuments()
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
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        let posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)} )
        return posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}
