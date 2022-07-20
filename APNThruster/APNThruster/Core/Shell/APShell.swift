//
//  APShell.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 10/07/2022.
//

import Foundation

final class APShell: Shell {
    
    // https://stackoverflow.com/questions/26971240/how-do-i-run-a-terminal-command-in-a-swift-script-e-g-xcodebuild
    // https://github.com/JohnSundell/ShellOut/blob/master/Sources/ShellOut.swift
    func run(_ command: String) throws -> String {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardInput = nil
        task.standardError = pipe
        task.arguments = ["-c", command]
        task.executableURL = URL(fileURLWithPath: "/bin/bash")
        
        try task.run()
        
        let data = try pipe.fileHandleForReading.readToEnd() ?? Data()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }
}
