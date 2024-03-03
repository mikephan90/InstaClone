//
//  AuthService.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to sign user in with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        try await UserService.shared.fetchCurrentUser()
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.currentUser = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        UserService.shared.currentUser = user
        
        /// Encode the data to Firebase
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return } // could potentially fail so need try here
        try? await FirebaseConstants.UsersCollection.document(user.id).setData(encodedUser) // location where data is going to go in firebase
    }
}
