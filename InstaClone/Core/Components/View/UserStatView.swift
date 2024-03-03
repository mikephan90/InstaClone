//
//  UserStatView.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    let title: String
    
    init(value: Int, title: String) {
        self.value = value
        self.title = title
    }
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .opacity(value == 0 ? 0.5 : 1.0)
        .frame(width: 88)
    }
}

struct UserStateView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 12, title: "Posts")
    }
}
