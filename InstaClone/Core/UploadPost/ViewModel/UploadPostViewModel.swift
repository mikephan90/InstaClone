//
//  UploadPostViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var postImage: Image? // load users selected profile image
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        
        // Get data image from the image picker
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.postImage = Image(uiImage: uiImage)
    }
}
