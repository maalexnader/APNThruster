//
//  Preset.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 13/07/2022.
//

/// A **preset** that will be used to restore last session
struct Preset {
    /// The device that is stored in current `Preset` instance
    let device: String
    let bundle: String
}

extension Preset: Codable { }
