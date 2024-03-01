//
//  ProfileHeaderView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 10, content: {
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(.circle)
                
                Spacer()
                
                HStack(spacing: 8, content: {
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 12, title: "Followers")
                    UserStatView(value: 19, title: "Following")
                })
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 4, content: {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Button("Edit Profile") {
                // Action here to edit profile
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 32)
            .foregroundColor(.black)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray, lineWidth: 1.0)
            }
        })
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
