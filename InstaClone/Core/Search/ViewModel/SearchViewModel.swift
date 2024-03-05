//
//  SearchViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/1/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {}
}
