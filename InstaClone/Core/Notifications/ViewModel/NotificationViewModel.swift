//
//  NotificationViewModel.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Foundation

@MainActor
class NotificationViewModel: ObservableObject {
    
    @Published var notifications = [Notification]()
    private let service: NotificationService
    
    init(service: NotificationService) {
        // DI
        self.service = service
        Task { await fetchNotifications() }
    }
    
    func fetchNotifications() async {
        do {
            self.notifications = try await service.fetchNotifications()
        } catch {
            print("DEBUG: Failed to fetch notifications with error \(error.localizedDescription)")
        }
    }
    
}
