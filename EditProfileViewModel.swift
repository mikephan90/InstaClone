//
//  EditProfileViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var fullname = ""
    @Published var bio = ""
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var profileImage: Image? // load users selected profile image
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        self.fullname = user.fullname ?? ""
        self.bio = user.bio ?? ""
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        
        // Get data image from the image picker
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String:Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        // Update data to Firebase via dictionary
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
    }
}
