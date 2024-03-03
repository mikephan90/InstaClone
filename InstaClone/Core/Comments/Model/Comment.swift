//
//  Comment.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Codable {
    @DocumentID var commentId: String?
    let postOwnerUid: String
    let commentText: String
    let postId: String
    let timestamp: Timestamp
    let commentOwnerUid: String
    
    var id: String  {
        return commentId ?? NSUUID().uuidString
    }
}
