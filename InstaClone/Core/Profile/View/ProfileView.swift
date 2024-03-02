//
//  ProfileView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            ProfileHeaderView(user: user)
            
            PostGridView(user: user)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[5])
    }
}
