//
//  CommentsView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import SwiftUI

struct CommentsView: View {
    
    @State private var commentText = ""
    @StateObject var viewModel: CommentsViewModel
    
    private var currentUser: User? {
        return UserService.shared.currentUser
    }
    
    init(post: Post) {
        self._viewModel = StateObject(wrappedValue: CommentsViewModel(post: post))
    }
    
    var body: some View {
        VStack {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 24)
            
            Divider()
            
            ScrollView {
                LazyVStack(spacing: 24, content: {
                    ForEach(viewModel.comments) { comment in
                        CommentsCell(comment: comment)
                    }
                })
                .padding(.top)
            }
            
            Divider()
            
            HStack(spacing: 12, content: {
                var commentIsEmpty = commentText == ""
                
                CircularProfileImageView(user: currentUser, size: .xsmall)
                
                ZStack(alignment: .trailing, content: {
                    //                    TextField("Add a comment for \(owner.userName)", text: $commentText, axis: .vertical)
                    TextField("Add a comment...", text: $commentText, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 45)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray5), lineWidth: 1.0)
                        }
                
                    Button(action: {
                        Task {
                            try await viewModel.uploadComment(commentText: commentText)
                            commentText = ""
                        }
                    }, label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(commentIsEmpty ? .gray : Color(.systemBlue))
                    })
                    .disabled(commentIsEmpty)
                    .padding(.horizontal)
                })
            })
            .padding(12)
        }
    }
}

#Preview {
    CommentsView(post: Post.MOCK_POST[0])
}
