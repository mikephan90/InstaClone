//
//  Timestamp.swift
//  InstaClone
//
//  Created by Mike Phan on 3/3/24.
//

import Firebase

extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
