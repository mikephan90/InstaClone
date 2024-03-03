//
//  FeedCellViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import Foundation

@MainActor
class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        Task { try await checkIfUserLikedPost() }
    }
    

    func like() async throws {
        do {
            // Update UI immediately then the back end
            let postCopy = post
            post.didLike = true
            post.likes += 1
            try await PostService.likePost(postCopy)
        } catch {
            // If any updates fail, revert change
            post.didLike = false
            post.likes -= 1
        }
    }
    
    func unlike() async throws {
        do {
            // Update UI immediately then the back end
            let postCopy = post
            post.didLike = false
            post.likes -= 1
            try await PostService.likePost(postCopy)
        } catch {
            // If any updates fail, revert change
            post.didLike = true
            post.likes += 1
        }
    }
    
    func checkIfUserLikedPost() async throws {
        self.post.didLike = try await PostService.checkIfUserLikedPost(post)
    }
}
