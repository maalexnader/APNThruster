//
//  AppDelegate.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 15/07/2022.
//

import AppKit
import Swinject

final class AppDelegate: NSObject, NSApplicationDelegate {
    let container: Container = {
        let container = Container()
        container.register(FileManager.self) { _ in APFileManager() }
        container.register(Encoder.self) { _ in APJSONEncoder() }
        container.register(Shell.self) { _ in APShell() }
        return container
    }()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("haha")
    }
    
}
