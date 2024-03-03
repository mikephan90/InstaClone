//
//  NotificationViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Foundation

class NotificationViewModel: ObservableObject {
    
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        self.notifications = DeveloperPreview.shared.notifications
    }
    
}
