//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import Foundation
import Firebase
import FirebaseFirestore

// Fetch post from database and pushing to the feed
class FeedViewModel: ObservableObject {
   
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
