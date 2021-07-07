//
//  SiriKitExampleApp.swift
//  SiriKitExample
//
//  Created by tigi KIM on 2021/07/07.
//

import SwiftUI

@main
struct SiriKitExampleApp: App {
    
    init() {
        UserActivityShortcutsManager.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
