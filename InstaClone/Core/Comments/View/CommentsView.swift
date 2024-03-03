//
//  CommentsView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import SwiftUI

struct CommentsView: View {
    
    @State private var commentText = ""
    
    private var user: User {
        return User.MOCK_USERS[0]
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
                    ForEach(0 ... 15, id: \.self) { comment in
                        CommentsCell()
                    }
                })
                .padding(.top)
            }
            
            Divider()
            
            HStack(spacing: 12, content: {
                CircularProfileImageView(user: user, size: .xsmall)
                
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
                        
                    }, label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.systemBlue))
                    })
                    .padding(.horizontal)
                })
            })
            .padding(12)
        }
    }
}

#Preview {
    CommentsView()
}
