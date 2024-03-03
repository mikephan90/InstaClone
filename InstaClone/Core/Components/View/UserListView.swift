//
//  UserListView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import SwiftUI

struct UserListView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = UserListViewModel()
    
    private let config: UserListConfig
    
    init(config: UserListConfig) {
        self.config = config
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.users) { user in
                    // Since we are selecting an object, we pass a user
                    NavigationLink(value: user) {
                        HStack {
                            CircularProfileImageView(user: user, size: .xsmall)
                            
                            VStack(alignment: .leading, content: {
                                Text(user.username)
                                    .fontWeight(.semibold)
                                
                                if let fullname = user.fullname {
                                    Text(fullname)
                                }
                            })
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .foregroundStyle(.black)
                    }
                }
            }
            .padding(.top, 8)
            .searchable(text: $searchText, prompt: "Search...")
        }
        .task { await viewModel.fetchUsers(forConfig: config) }
    }
}

#Preview {
    UserListView(config: .explore)
}
