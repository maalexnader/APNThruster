//
//  APJSONEncoder.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 09/07/2022.
//

import Foundation

final class APJSONEncoder: Encoder {
    private let encoder = JSONEncoder()
    func encode(_ notification: APNotification) throws -> String {
        let encodedNotification = try encoder.encode(notification)
        guard let encodedString = String(data: encodedNotification, encoding: .utf8) else {
            return ""
        }
        return encodedString
    }
}
