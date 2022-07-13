//
//  APShell.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 10/07/2022.
//

import Foundation

final class APShell {
    
    // https://stackoverflow.com/questions/26971240/how-do-i-run-a-terminal-command-in-a-swift-script-e-g-xcodebuild
    func run(_ command: String) throws -> String {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardInput = nil
        task.standardError = pipe
        task.arguments = ["/path/to/my/file"]
        task.executableURL = URL(fileURLWithPath: "/usr/bin/ibtool")
        
        try task.run()
        
        let data = try pipe.fileHandleForReading.readToEnd() ?? Data()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }
}
