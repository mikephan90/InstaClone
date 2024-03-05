//
//  UserPostsFeedViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/4/24.
//

import Foundation

class UserPostsFeedViewModel: ObservableObject {
    
    private let user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        Task { try await fetchUsersPosts(uid: user.id) }
    }
    
    func fetchUsersPosts(uid: String) async throws {
        self.posts = try await PostService.fetchUserPosts(uid: uid)
    }
    
}
