//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FeedViewModel: ObservableObject {
   
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchAllNonCurrentUserPosts() }
    }

    /// This is used if the decision to display the user's own posts as an option. Else filter out
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
    
    @MainActor
    func fetchAllNonCurrentUserPosts() async throws {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let allPosts = try await PostService.fetchFeedPosts()
        self.posts = allPosts.filter{ $0.ownerUid != userId }
    }
}
