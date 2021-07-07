//
//  BlueView.swift
//  SiriKitExample
//
//  Created by tigi KIM on 2021/07/07.
//

import SwiftUI
import Intents

struct BlueView: View {

    let shortcut: INShortcut = UserActivityShortcutsManager.Shortcut.blueview.makeShortcut()

    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
        
            SiriButton(shortcut: shortcut).frame(height: 34)
        }
    }
}

struct BlueView_Previews: PreviewProvider {
    static var previews: some View {
        BlueView()
    }
}
