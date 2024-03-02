//
//  PostGridView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let width = UIScreen.main.bounds.width / 3
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        
        LazyVGrid(columns: gridItems, spacing: 2, content: {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipped()
            }
        })
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS[0])
}
