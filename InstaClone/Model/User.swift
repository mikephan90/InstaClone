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
    
    // Look at the current user if there is one
    var isCurrentUser : Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "ironman1", profileImageUrl: "ironman2", fullname: "Tony Stark", bio: "Your billionare, playboy, philantrophist", email: "ironman@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "hulk1", profileImageUrl: "hulk1", fullname: "Bruce Banner", bio: "Big green mean machine", email: "hulk@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "blackpanther1", profileImageUrl: "blackpanther1", fullname: "Tchalla", bio: "Wakanda Forever", email: "blackpanther@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "spiderman1", profileImageUrl: "spiderman1", fullname: "Peter Parker", bio: "Friendly neighborhood spiderman", email: "spidey@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "blackwidow1", profileImageUrl: "blackwidow1", fullname: "Natasha Romanoff", bio: "Black black sneaky sneak", email: "bw@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "captainamerica1", profileImageUrl: "captainamerica1", fullname: "Steve Rogers", bio: "I am the captain", email: "ca@iam.com"),
        
            .init(id: NSUUID().uuidString, username: "thor1", profileImageUrl: "thor1", fullname: "Thor Odinson", bio: "Asgard is my home", email: "thor@iam.com")
    ]
}
