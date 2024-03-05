//
//  UserListViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
    }
    
    func fetchUsers(forConfig config: UserListConfig) async  {
        do {
            self.users = try await UserService.fetchUsers(forConfig: config)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
