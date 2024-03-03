//
//  UserListConfig.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Foundation

enum UserListConfig: Hashable {
    
    // All types of user lists
    case followers(uid: String)
    case following(uid: String)
    case likes(postId: String)
    case explore
    
    var navigationTitle: String {
        switch self {
        case .followers: return "Followers"
        case .following: return "Followings"
        case .likes: return "Likes"
        case .explore: return "Explore"
        }
    }
}
