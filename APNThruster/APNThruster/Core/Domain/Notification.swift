//
//  Notification.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 01/07/2022.
//

/// A **nottification** that will be pushed to selected devcie
struct APNotification {
    /// The aps key of the `APNotification` instance
    let aps: Aps?
    
    /// The badge that will be shown on the application icon
    let badge: String?
    
    /// The sound produced when the notification delivered
    let sound: String?
    
    /// An **aps key** part
    struct Aps {
        let alert: Alert?
        
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
}

extension APNotification.Aps.Alert: Codable { }

extension APNotification.Aps: Codable { }

extension APNotification: Codable { }
