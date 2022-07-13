//
//  EncoderMock.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 10/07/2022.
//

import Foundation

final class EncoderMock: Encoder {
    private let encoder = JSONEncoder()
    
    func encode<T>(_ item: T) throws -> String where T : Encodable {
        let encodedItem = try encoder.encode(item)
        guard let encodedString = String(data: encodedItem, encoding: .utf8) else {
            return ""
        }
        return encodedString
    }
    
    func decode<T>(_ item: String) throws -> T where T : Decodable {
        guard let data = item.data(using: .utf8) else {
            throw EncoderError.decodingError
        }
        let dcodedItem = try JSONDecoder().decode(T.self, from: data)
        return dcodedItem
    }
    
    enum EncoderError: Error {
        case decodingError
    }
}
