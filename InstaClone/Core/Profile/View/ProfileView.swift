//
//  ProfileView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Header
                VStack(spacing: 10, content: {
                    HStack {
                        Image("blackpanther2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(.circle)
                        
                        Spacer()
                        
                        HStack(spacing: 8, content: {
                            UserStatView(value: 3, title: "Posts")
                            UserStatView(value: 12, title: "Followers")
                            UserStatView(value: 19, title: "Following")
                        })
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 4, content: {
                        Text("Chadwick Boseman")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Wakanda Forever")
                            .font(.footnote)
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Button("Edit Profile") {
                        // Action here to edit profile
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1.0)
                    }
                })
                
                Divider()
                
                GeometryReader { geometry in
                    let width = geometry.size.width / 3
                    LazyVGrid(columns: gridItems, spacing: 2, content: {
                        ForEach(0 ... 8, id: \.self) { index in
                            Image("blackpanther1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: width)
                                .clipped()
                        }
                    })
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color.black)
                    })
                }
            })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
