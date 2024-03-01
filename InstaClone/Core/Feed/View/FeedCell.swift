//
//  FeedCell.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("ironman2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
                
                Text("ironman1")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading, 8)
            
            Image("ironman1")
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 400) // use actual height of image
                .clipShape(.rect)
            
            HStack(spacing: 8, content: {
                Button(action: {
                    print("like post")
                }, label: {
                    Image(systemName: "heart")
                })
                
                Button(action: {
                    print("comment on post")
                }, label: {
                    Image(systemName: "bubble.right")
                })
                
                Button(action: {
                    print("share post")
                }, label: {
                    Image(systemName: "paperplane")
                })
                Spacer()
            })
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(Color.black)
            
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            HStack {
                Text("ironman1 ")
                    .fontWeight(.semibold) +
                Text("I am Iron Man")
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    FeedCell()
}
