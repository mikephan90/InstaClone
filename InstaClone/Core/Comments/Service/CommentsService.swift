//
//  CommentsService.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import Firebase
import FirebaseFirestoreSwift

struct CommentsService {

    let postId: String
    
    func uploadComment(_ comment: Comment) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        
        try await FirebaseConstants.PostsCollection
            .document(postId)
            .collection("post-comments")
            .addDocument(data: commentData)
    }
    
    func fetchComments() async throws -> [Comment] {
        let snapshot = try await FirebaseConstants.PostsCollection
            .document(postId)
            .collection("post-comments")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Comment.self) })
    }
}
