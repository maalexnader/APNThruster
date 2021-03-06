//
//  APJSONEncoder.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 09/07/2022.
//

import Foundation

final class APJSONEncoder: Encoder {
    func encode<T>(_ item: T) throws -> String where T : Encodable {
        let encodedItem = try JSONEncoder().encode(item)
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
