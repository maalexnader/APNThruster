//
//  MainViewModel.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 04/07/2022.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {    
    @Published var alertTitle: String = ""
    @Published var alertSubtitle: String = ""
    @Published var alertBody: String = ""
    @Published var badge: String = ""
    @Published var sound: String = ""
    
    func handlePush() {
        let encoder = APJSONEncoder()
        let notification = APNotification(
            alert: APNotification.Alert(
                title: alertTitle,
                subtitle: alertSubtitle,
                body: alertBody
            ),
            badge: badge,
            sound: sound
        )
        if let result = try? encoder.encode(notification) {
            print(result)
        }
    }
}
