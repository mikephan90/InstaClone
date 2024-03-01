//
//  LoginView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("instagram-logo-text")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                }
                
                Button("Forgot Password?") {
                    print("forgot password")
                }
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.trailing, 28)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button("Log In") {
                    Task { try await viewModel.signIn() }
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .frame(width: 360, height: 44)
                .background(Color.blue)
                .cornerRadius(8)
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundStyle(Color.gray)
                
                HStack {
                    Image("facebook-logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.blue)
                        .padding(.top, 8)
                }
                
                Spacer()
                
                Divider()
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3, content: {
                        Text("Don't have an account?")
                            .font(.footnote)
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    })
                    .padding(.vertical, 16)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
