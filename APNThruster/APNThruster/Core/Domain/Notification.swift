//
//  Notification.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 01/07/2022.
//

/// A **nottification** that will be pushed to selected devcie
struct APNotification {
    /// The alert of the `APNotification` instance
    let alert: Alert?
    
    /// The badge that will be shown on the application icon
    let badge: String?
    
    /// The sound produced when the notification delivered
    let sound: String?
    
    /// An **alert** part
    struct Alert {
        /// The title of the notification
        let title: String?
        
        /// The subtitle of the notification
        let subtitle: String?
        
        /// The body o fthe notification
        let body: String?
    }
}

extension APNotification.Alert: Codable { }

extension APNotification: Codable { }
