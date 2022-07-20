//
//  Shell.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 15/07/2022.
//

protocol Shell {
    func run(_ command: String) throws -> String
}
