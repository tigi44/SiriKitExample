//
//  RedView.swift
//  SiriKitExample
//
//  Created by tigi KIM on 2021/07/07.
//

import SwiftUI
import Intents

struct RedView: View {
    
    let shortcut: INShortcut = UserActivityShortcutsManager.Shortcut.redview.makeShortcut()
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
        
            SiriButton(shortcut: shortcut).frame(height: 34)
        }
    }
}

struct RedView_Previews: PreviewProvider {
    static var previews: some View {
        RedView()
    }
}
