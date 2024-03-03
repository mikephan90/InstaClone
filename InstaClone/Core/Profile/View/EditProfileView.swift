//
//  EditProfileView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State private var selectedImage: PhotosPickerItem?
    
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            // toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                Divider()
            }
        
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(.circle)
                            .frame(width: 80, height: 80)
                            .padding(.top, 8)
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .large)
                    }
                    
                    Text("Edit profile pic")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.bottom, 8)
                    
                    Divider()
                }
            }
            
            VStack(spacing: 8, content: {
                EditProfileRowView(title: "Name", placeholder: "Enter your name..", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
                Spacer()
            })
            .padding(.top, 8)
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
