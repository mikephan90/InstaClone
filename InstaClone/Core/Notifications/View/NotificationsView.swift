//
//  NotificationsView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import SwiftUI

struct NotificationsView: View {
    
    @StateObject var viewModel = NotificationViewModel(service: NotificationService())
    
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
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationsView()
}
