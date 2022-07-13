//
//  FileManagerMock.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 10/07/2022.
//

import Foundation

final class FileManagerMock: FileManager {
    var apnsFilePath: URL { URL(fileURLWithPath: "") }
    var presetFilePath: URL { URL(fileURLWithPath: "") }
    
    func getPreset() -> String? {
        nil
    }
    
    func updateApns(with content: String) -> Bool {
        true
    }
    
    func updatePreset(with content: String) -> Bool {
        true
    }
}
