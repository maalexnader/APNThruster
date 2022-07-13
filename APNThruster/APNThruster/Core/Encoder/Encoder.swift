//
//  Encoder.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 09/07/2022.
//

protocol Encoder {
    func encode<T>(_ item: T) throws -> String where T : Encodable
    func decode<T>(_ item: String) throws -> T where T : Decodable
}
