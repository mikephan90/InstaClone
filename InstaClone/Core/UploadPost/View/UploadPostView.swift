//
//  UploadPostView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @State private var photoItem: PhotosPickerItem?
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
 
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    clearPostDataAndReturnToFeed()
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button("Upload") {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                }
                .fontWeight(.semibold)
            }
            .padding(.horizontal)
            
            HStack {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
    
    private func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(1))
}
