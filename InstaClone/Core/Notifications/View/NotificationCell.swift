//
//  NotificationCell.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import SwiftUI

struct NotificationCell: View {
    
    let notification: Notification
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: nil, size: .xsmall)
            
            // Notification message
            HStack {
                Text("yuki")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                
                Text(" \(notification.type.notificationMessage)")
                    .font(.subheadline) +
                
                Text(" 3w")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
            Spacer()
            
            // depending on notificatyion type, we display something different
            if notification.type != .follow {
                Image("ironman2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
            } else {
                Button(action: {
                    // follow
                }, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 88, height: 32)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                })
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell(notification: DeveloperPreview.shared.notifications[2])
}
