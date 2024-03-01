//
//  CompleteSignupView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct CompleteSignupView: View {
  
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12, content: {
            
            Spacer()
            
            // TODO: Create resuable view here
            Text("Welcome to Instagram,\nMike Phan")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration and start using Instagram")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button("Complete Sign Up") {
                print("complete sign up")
            }         
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .frame(width: 360, height: 44)
            .background(Color.blue)
            .cornerRadius(8)
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
    CompleteSignupView()
}
