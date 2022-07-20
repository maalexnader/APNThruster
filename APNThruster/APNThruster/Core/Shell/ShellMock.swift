//
//  ShellMock.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 18/07/2022.
//

final class ShellMock: Shell {
    func run(_ command: String) throws -> String {
        "did nothing"
    }
}
