//
//  FileManager.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 10/07/2022.
//

import Foundation

/// A **FileManager** responsible for creating *apns* file
protocol FileManager {
    var apnsFilePath: URL { get }
    var presetFilePath: URL { get }
    func getPreset() -> String? 
    func updateApns(with content: String) -> Bool
    func updatePreset(with content: String) -> Bool
}
