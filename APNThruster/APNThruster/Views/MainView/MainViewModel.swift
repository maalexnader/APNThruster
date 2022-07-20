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
    private let shell: Shell
    
    @Published var device: String = "" {
        didSet {
            storeDevice()
        }
    }
    
    @Published var bundle: String = "" {
        didSet {
            storeDevice()
        }
    }
    
    @Published var alertTitle: String = ""
    @Published var alertSubtitle: String = ""
    @Published var alertBody: String = ""
    @Published var badge: String = ""
    @Published var sound: String = ""
    
    init(encoder: Encoder, fileManager: FileManager, shell: Shell) {
        self.encoder = encoder
        self.fileManager = fileManager
        self.shell = shell
        loadPreset()
    }
    
    func handlePush() {
        let notification = APNotification(
            aps: APNotification.Aps(
                alert: APNotification.Aps.Alert(
                    title: alertTitle,
                    subtitle: alertSubtitle,
                    body: alertBody
                )
            ),
            badge: badge,
            sound: sound
        )
        
        if let encodedNotification = try? encoder.encode(notification) {
            if fileManager.updateApns(with: encodedNotification) {
                _ = try? shell.run("xcrun simctl push \(device) \(bundle) \(fileManager.apnsFilePath.path)")
            }
        }
    }
    
    private func loadPreset() {
        guard let presetData = fileManager.getPreset() else {
            return
        }
        guard let preset: Preset = try? encoder.decode(presetData) else {
            return
        }
        device = preset.device
        bundle = preset.bundle
    }
    
    private func storeDevice() {
        let preset = Preset(device: device, bundle: bundle)
        if let encodedPreset = try? encoder.encode(preset) {
            _ = fileManager.updatePreset(with: encodedPreset)
        }
    }
}
