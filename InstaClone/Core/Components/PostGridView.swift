//
//  PostGridView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct PostGridView: View {
    
    var posts: [Post]
    
    private let width = UIScreen.main.bounds.width / 3
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        
        LazyVGrid(columns: gridItems, spacing: 2, content: {
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipped()
            }
        })
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POST)
}
