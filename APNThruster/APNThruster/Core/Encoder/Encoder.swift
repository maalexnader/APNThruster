//
//  Encoder.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 09/07/2022.
//

import Foundation

protocol Encoder {
    func encode(_ notification: APNotification) throws -> String
}
