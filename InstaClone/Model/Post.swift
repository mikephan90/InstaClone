//
//  Post.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POST: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now here it is",
            likes: 12232,
            imageUrl: "ironman2",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 432,
                imageUrl: "spiderman3",
                timestamp: Date(),
                user: User.MOCK_USERS[3]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 43223,
                imageUrl: "thor2",
                timestamp: Date(),
                user: User.MOCK_USERS[6]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 43,
                imageUrl: "ironman6",
                timestamp: Date(),
                user: User.MOCK_USERS[0]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 432,
                imageUrl: "hulk1",
                timestamp: Date(),
                user: User.MOCK_USERS[1]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 333,
                imageUrl: "captainamerica3",
                timestamp: Date(),
                user: User.MOCK_USERS[5]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 232,
                imageUrl: "blackwidow1",
                timestamp: Date(),
                user: User.MOCK_USERS[4]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 432,
                imageUrl: "spiderman1",
                timestamp: Date(),
                user: User.MOCK_USERS[3]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 232,
                imageUrl: "blackpanther1",
                timestamp: Date(),
                user: User.MOCK_USERS[2]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 333,
                imageUrl: "captainamerica2",
                timestamp: Date(),
                user: User.MOCK_USERS[5]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 43223,
                imageUrl: "thor1",
                timestamp: Date(),
                user: User.MOCK_USERS[6]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 44233,
                imageUrl: "ironman4",
                timestamp: Date(),
                user: User.MOCK_USERS[0]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 41113,
                imageUrl: "ironman5",
                timestamp: Date(),
                user: User.MOCK_USERS[0]
            ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                caption: "This is some test caption for now here it is",
                likes: 333,
                imageUrl: "captainamerica1",
                timestamp: Date(),
                user: User.MOCK_USERS[5]
            ),
    ]
}
