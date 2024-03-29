//
//  NotificationsView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import SwiftUI

struct NotificationsView: View {
    
    @StateObject var viewModel = NotificationViewModel(service: NotificationService())
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false, content: {
                LazyVStack(spacing: 20, content: {
                    ForEach(viewModel.notifications) { notification in
                        NotificationCell(notification: notification)
                            .padding(.top)
                    }
                })
            })
            .refreshable {
                Task { await viewModel.fetchNotifications() }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationDestination(for: Post.self, destination: { post in
                FeedCell(post: post)
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 10, content: {
                            Image(systemName: "chevron.left")
                            Text("Notifications")
                                .font(.title2)
                                .fontWeight(.bold)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
