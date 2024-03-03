//
//  CommentsCell.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import SwiftUI

struct CommentsCell: View {
    
    private var user: User {
        return User.MOCK_USERS[0]
    }
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xsmall)
    
            VStack (alignment: .leading, spacing: 4, content: {
                
                HStack(spacing: 2, content: {
                    Text(user.username)
                        .fontWeight(.semibold)
                    Text("6d")
                        .foregroundStyle(Color.gray)
                })
                
                Text("How dabout that! I believe in YOU!")
            })
            .font(.caption)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentsCell()
}
