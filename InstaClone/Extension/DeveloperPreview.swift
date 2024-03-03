//
//  DeveloperPreview.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(
        postOwnerUid: "123",
        commentText: "Test comment",
        postId: "322",
        timestamp: Timestamp(),
        commentOwnerUid: "198273981"
    )
    
    
}
