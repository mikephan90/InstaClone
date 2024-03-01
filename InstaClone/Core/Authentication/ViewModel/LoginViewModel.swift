//
//  LoginViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
