//
//  FeedView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct FeedView: View {
    
    @State private var scrollValue = false
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView {
            ScrollViewReader { scrollViewProxy in
                ScrollView(showsIndicators: false, content: {
                    LazyVStack(spacing: 32, content: {
                        ForEach(viewModel.posts) { post in
                            FeedCell(post: post)
                        }
                    })
                    .id("feedContent")
                    .padding(.top, 8)
                })
                .onChange(of: scrollValue, initial: false, { _,_ in
                    withAnimation {
                        scrollViewProxy.scrollTo("feedContent", anchor: .top)
                    }
                })
                .refreshable {
                    Task { try await viewModel.fetchAllNonCurrentUserPosts() }
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            scrollValue.toggle()
                        } label: {
                            Image("instagram-logo-text")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 28)
                        }
                        
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: NotificationsView().navigationBarHidden(true)) {
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .padding(.trailing)
                        }
                       
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                    }
                })
            }
        }
    }
}

#Preview {
    FeedView()
}
