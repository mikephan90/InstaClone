//
//  FeedView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false, content: {
                LazyVStack(spacing: 32, content: {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                })
                .padding(.top, 8)
            })
            .refreshable {
                Task { try await viewModel.fetchPosts() }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Image("instagram-logo-text")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 28)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            })
        }
    }
}

#Preview {
    FeedView()
}
