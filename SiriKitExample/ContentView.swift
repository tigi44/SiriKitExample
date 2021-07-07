//
//  ContentView.swift
//  SiriKitExample
//
//  Created by tigi KIM on 2021/07/07.
//

import SwiftUI

struct ContentView: View {
    
    @State var showRedView: Bool = false
    @State var showBlueView: Bool = false
    
    var body: some View {
        
        VStack(spacing: 100) {
            Button(action: {
                showRedView.toggle()
            }, label: {
                Label("Show a RedView", systemImage: "eye.circle.fill")
            })
            .foregroundColor(.red)
            
            Button(action: {
                showBlueView.toggle()
            }, label: {
                Label("Show a BlueView", systemImage: "eye.circle.fill")
            })
            .foregroundColor(.blue)
        }
        .sheet(isPresented: $showRedView, content: {
            RedView()
        })
        .sheet(isPresented: $showBlueView, content: {
            BlueView()
        })
        .onContinueUserActivity(UserActivityShortcutsManager.Shortcut.redview.type, perform: { userActivity in
            showRedView.toggle()
        })
        .onContinueUserActivity(UserActivityShortcutsManager.Shortcut.blueview.type, perform: { userActivity in
            showBlueView.toggle()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
