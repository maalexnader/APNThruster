//
//  APNThrusterApp.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 01/07/2022.
//

import SwiftUI

@main
struct APNThrusterApp: App {
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    private let width: CGFloat = 470
    private let height: CGFloat = 720
    
    var body: some Scene {
        WindowGroup {
            Main(
                model: MainViewModel(
                    encoder: appDelegate.container.resolve(Encoder.self)!,
                    fileManager: appDelegate.container.resolve(FileManager.self)!,
                    shell: appDelegate.container.resolve(Shell.self)!
                )
            )
            .frame(
                minWidth: width * 0.7,
                idealWidth: width,
                maxWidth: width * 1.7,
                minHeight: height * 0.7,
                idealHeight: height,
                maxHeight: height * 1.7,
                alignment: .center
            )
        }
    }
}
