//
//  UserPostsFeedView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/4/24.
//

import SwiftUI

struct UserPostsFeedView: View {
    
    @StateObject var viewModel: UserPostsFeedViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserPostsFeedViewModel(user: user))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false, content: {
            LazyVStack(spacing: 32, content: {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post)
                }
            })
            .padding(.top, 8)
        })
        .navigationTitle("username's Posts")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserPostsFeedView(user: User.MOCK_USERS[0])
}
