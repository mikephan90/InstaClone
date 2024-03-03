//
//  CommentsViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import Firebase

@MainActor
class CommentsViewModel: ObservableObject {
    
    @Published var comments = [Comment]()
    
    // All comments have a dependency on a Post
    private let post: Post
    private let service: CommentsService
    
    init(post: Post) {
        self.post = post
        self.service = CommentsService(postId: post.id)
        
        Task { try await fetchComments() }
    }
    
    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let comment = Comment(
            postOwnerUid: post.ownerUid,
            commentText: commentText,
            postId: post.id,
            timestamp: Timestamp(),
            commentOwnerUid: uid
        )
        
        try await service.uploadComment(comment)
        try await fetchComments()
    }

    func fetchComments() async throws {
        self.comments = try await service.fetchComments()
        try await fetchUserDataForComments()
    }
    
    private func fetchUserDataForComments() async throws {
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let user = try await UserService.fetchUser(withUid: comment.commentOwnerUid)
            comments[i].user = user
        }
    }
}
