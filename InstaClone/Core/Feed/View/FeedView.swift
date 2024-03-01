//
//  FeedView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32, content: {
                    ForEach(0 ... 10, id: \.self) { post in
                        FeedCell()
                    }
                })
                .padding(.top, 8)
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
