//
//  EditProfileRowView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/2/24.
//

import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var tempText = "temp text"
    static var previews: some View {
        EditProfileRowView(title: "Test", placeholder: "temp placeholder", text: $tempText)
    }
}
