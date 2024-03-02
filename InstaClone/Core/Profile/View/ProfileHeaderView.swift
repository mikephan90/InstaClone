//
//  ProfileHeaderView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 10, content: {
            HStack {
                
                if let userProfileImage = user.profileImageUrl {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(.circle)
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(.circle)
                }
               
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
            
            Button(user.isCurrentUser ? "Edit Profile" : "Follow") {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Follow user")
                }
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 32)
            .background(user.isCurrentUser ? .white : Color(.systemBlue))
            .foregroundColor(user.isCurrentUser ? .black : .white)
            .cornerRadius(6)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1.0)
            }
            
            Divider()
        })
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
