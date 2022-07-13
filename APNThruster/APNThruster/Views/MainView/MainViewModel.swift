//
//  MainViewModel.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 04/07/2022.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {
    private let encoder: Encoder
    private let fileManager: FileManager
    
    @Published var device: String = "" {
        didSet {
            storeDevice()
        }
    }
    
    @Published var alertTitle: String = ""
    @Published var alertSubtitle: String = ""
    @Published var alertBody: String = ""
    @Published var badge: String = ""
    @Published var sound: String = ""
    
    init(encoder: Encoder, fileManager: FileManager) {
        self.encoder = encoder
        self.fileManager = fileManager
        loadPreset()
    }
    
    func handlePush() {
        let notification = APNotification(
            alert: APNotification.Alert(
                title: alertTitle,
                subtitle: alertSubtitle,
                body: alertBody
            ),
            badge: badge,
            sound: sound
        )
        
        if let encodedNotification = try? encoder.encode(notification) {
            if fileManager.updateApns(with: encodedNotification) {
                // print(fileManager.apnsFilePath)
            }
        }
        
        print("xcrun simctl push \(device) com.example.my-app \(fileManager.apnsFilePath.path)")
        print(try? APShell().run("xcrun simctl push \(device) com.example.my-app \(fileManager.apnsFilePath.path)") ?? "Error")
    }
    
    private func loadPreset() {
        guard let presetData = fileManager.getPreset() else {
            return
        }
        guard let preset: Preset = try? encoder.decode(presetData) else {
            return
        }
        device = preset.device
    }
    
    private func storeDevice() {
        let preset = Preset(device: device)
        if let encodedPreset = try? encoder.encode(preset) {
            _ = fileManager.updatePreset(with: encodedPreset)
        }
    }
}
