//
//  APFileManager.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 10/07/2022.
//

import Foundation

final class APFileManager: FileManager {
    private let apnsFileName = "notification.apns"
    private let presetFileName = "preset.json"
    private var directoryPath: URL {
        let paths = Foundation.FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths.first?.appendingPathComponent("APNThruster") ?? URL(fileURLWithPath: "")
    }
    
    var apnsFilePath: URL {
        directoryPath.appendingPathComponent(apnsFileName)
    }
    
    var presetFilePath: URL {
        directoryPath.appendingPathComponent(presetFileName)
    }
    
    func updateApns(with content: String) -> Bool {
        update(apnsFilePath, with: content)
    }
    
    func updatePreset(with content: String) -> Bool {
        update(presetFilePath, with: content)
    }
    
    func getPreset() -> String? {
        do {
            return try String(contentsOfFile: presetFilePath.path, encoding: .utf8)
        } catch {
            return nil
        }
    }
    
    private func update(_ path: URL, with content: String) -> Bool {
        do {
            try Foundation.FileManager.default.createDirectory(at: directoryPath, withIntermediateDirectories: true)
            try content.write(to: path, atomically: true, encoding: .utf8)
            return true
        } catch {
            return false
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = Foundation.FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
