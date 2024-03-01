//
//  CreateUsernameView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct CreateUsernameView: View {
    
    @State private var username = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12, content: {
            
            // TODO: Create resuable view here
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Pick a username for your new account. You can always change it later.")
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Username", text: $username)
                .modifier(IGTextFieldModifier())
                .autocapitalization(.none)
                .padding(.top)
            
            NavigationLink(destination: CreatePasswordView().navigationBarBackButtonHidden()) {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(width: 360, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
        })
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    CreateUsernameView()
}
