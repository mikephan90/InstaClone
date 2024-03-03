//
//  CommentsCell.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import SwiftUI

struct CommentsCell: View {
    
    let comment: Comment
    
    private var user: User? {
        return comment.user
    }
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xsmall)
    
            VStack (alignment: .leading, spacing: 4, content: {
                
                HStack(spacing: 2, content: {
                    Text(user?.username ?? "")
                        .fontWeight(.semibold)
                    Text(comment.timestamp.timestampString())
                        .foregroundStyle(Color.gray)
                })
                
                Text(comment.commentText)
            })
            .font(.caption)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentsCell(comment: dev.comment)
    }
}
