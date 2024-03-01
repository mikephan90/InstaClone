//
//  RegistrationViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
   
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        // Reset upon completion
        username = ""
        email = ""
        password = ""
    }
}
