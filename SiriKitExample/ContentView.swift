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
    @State var showIntentView: Bool = false
    @State var intentViewText: String? = nil
    
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
            
            Button(action: {
                intentViewText = nil
                showIntentView.toggle()
            }, label: {
                Label("Show a IntentView", systemImage: "eye.circle.fill")
            })
            .foregroundColor(.primary)
        }
        .sheet(isPresented: $showRedView, content: {
            RedView()
        })
        .sheet(isPresented: $showBlueView, content: {
            BlueView()
        })
        .sheet(isPresented: $showIntentView, content: {
            IntentView(text: intentViewText)
        })
        .onContinueUserActivity(UserActivityShortcutsManager.Shortcut.redview.type, perform: { userActivity in
            showRedView.toggle()
        })
        .onContinueUserActivity(UserActivityShortcutsManager.Shortcut.blueview.type, perform: { userActivity in
            showBlueView.toggle()
        })
        .onContinueUserActivity("ShowIntentViewIntent", perform: { userActivity in
            
            if let intent = userActivity.interaction?.intent
                as? ShowIntentViewIntent {
                intentViewText = intent.text
            }
            
            showIntentView.toggle()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
