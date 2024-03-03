//
//  User.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    // Add default here as it is unique to each individual user
    var isFollowed: Bool? = false
    
    // Look at the current user if there is one
    var isCurrentUser : Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "ironman1", profileImageUrl: nil, fullname: "Tony Stark", bio: "Your billionare, playboy, philantrophist", email: "ironman@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "hulk1", profileImageUrl: nil, fullname: "Bruce Banner", bio: "Big green mean machine", email: "hulk@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "blackpanther1", profileImageUrl: nil, fullname: "Tchalla", bio: "Wakanda Forever", email: "blackpanther@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "spiderman1", profileImageUrl: nil, fullname: "Peter Parker", bio: "Friendly neighborhood spiderman", email: "spidey@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "blackwidow1", profileImageUrl: nil, fullname: "Natasha Romanoff", bio: "Black black sneaky sneak", email: "bw@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "captainamerica1", profileImageUrl: nil, fullname: "Steve Rogers", bio: "I am the captain", email: "ca@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "thor1", profileImageUrl: nil, fullname: "Thor Odinson", bio: "Asgard is my home", email: "thor@iam.com")
    ]
}
