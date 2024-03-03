//
//  FeedCell.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    @ObservedObject var viewModel: FeedCellViewModel
    @State private var showComments = false
    
    private var post: Post {
        return viewModel.post
    }
    
    private var didLike: Bool {
        return post.didLike ?? false
    }
    
    init(post: Post) {
        self.viewModel = FeedCellViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xsmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
               
                Spacer()
            }
            .padding(.leading, 8)
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 400) // use actual height of image
                .clipShape(.rect)
            
            HStack(spacing: 8, content: {
                Button(action: {
                    handleLikeTapped()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundStyle(didLike ? .red : .black)
                })
                
                Button(action: {
                    showComments.toggle()
                }, label: {
                    Image(systemName: "bubble.right")
                })
                
                Button(action: {
                    print("share post")
                }, label: {
                    Image(systemName: "paperplane")
                })
                Spacer()
            })
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(Color.black)
            
            if post.likes > 0 {
                Text("\(post.likes) likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 1)
            }
            
            HStack {
                Text("\(post.user?.username ?? "") ")
                    .fontWeight(.semibold) +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text(post.timestamp.timestampString())
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(Color.gray)
        }
        .sheet(isPresented: $showComments, content: {
            CommentsView(post: post)
                .presentationDragIndicator(.visible)
        })
    }
    
    private func handleLikeTapped() {
        Task {
            if didLike {
                try await viewModel.unlike()
            } else {
                try await viewModel.like()
            }
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POST[0])
}
