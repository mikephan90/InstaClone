//
//  Post.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import Foundation
import Firebase

struct Post: Identifiable, Codable, Hashable {
    // Global post user info
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
    // Local, unique to user
    var didLike: Bool? = false // This won't come back from Firestore
}

extension Post {
    static let MOCK_IMAGE_URL = "https://firebasestorage.googleapis.com:443/v0/b/instaclone-3e25c.appspot.com/o/profile_images%2F4CFD6B74-C551-4569-A351-79D09F1D50BE?alt=media&token=daa688b8-0a8b-4753-be34-1cf7a855e7d0"
    
    static var MOCK_POST: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 12232,
            imageUrl: MOCK_IMAGE_URL,
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 432,
            imageUrl: "spiderman3",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 43223,
            imageUrl: "thor2",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[6]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 43,
            imageUrl: "ironman6",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 432,
            imageUrl: "hulk1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 333,
            imageUrl: "captainamerica3",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[5]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 232,
            imageUrl: "blackwidow1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[4]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 432,
            imageUrl: "spiderman1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 232,
            imageUrl: "blackpanther1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 333,
            imageUrl: "captainamerica2",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[5]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 43223,
            imageUrl: "thor1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[6]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 44233,
            imageUrl: "ironman4",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 41113,
            imageUrl: "ironman5",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
    
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 333,
            imageUrl: "captainamerica1",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[5]
        ),
    ]
}
