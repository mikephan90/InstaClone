//
//  UploadPostViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import PhotosUI
import Firebase
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    private var uiImage: UIImage?
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var postImage: Image? // load users selected profile image
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        
        // Get data image from the image picker
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        
        self.postImage = Image(uiImage: uiImage)
    }
    
    // Function to upload posts
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        
        // Generate the post object
        let post = Post(
            id: postRef.documentID,
            ownerUid: uid,
            caption: caption,
            likes: 0,
            imageUrl: imageUrl,
            timestamp: Timestamp()
        )
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        // Upload to Firestore
        try await postRef.setData(encodedPost)
    }
}
