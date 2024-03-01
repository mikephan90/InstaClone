//
//  MainTabView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            FeedView()
                .onAppear{
                    selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            SearchView()
                .onAppear{
                    selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            UploadPostView(tabIndex: $selectedTab)
                .onAppear{
                    selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            
            Text("Notifications")
                .onAppear{
                    selectedTab = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }
                .tag(3)
            
            CurrentUserProfileView(user: User.MOCK_USERS[0])
                .onAppear{
                    selectedTab = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
        })
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
