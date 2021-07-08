//
//  IntentView.swift
//  SiriKitExample
//
//  Created by tigi KIM on 2021/07/08.
//

import SwiftUI
import Intents

struct IntentView: View {
    
    var text: String? = nil
    
    var body: some View {
        
        VStack(spacing: 50) {
            Text("Hello IntentView!")
            
            if let text = text {
                Text("Input text : \(text)")
            }
            
            SiriButton(shortcut: makeShortcut()).frame(height: 34)
        }
    }
    
    private func makeShortcut() -> INShortcut? {
        let intent = ShowIntentViewIntent()
        intent.suggestedInvocationPhrase = "인텐트뷰 보여줘"
        return INShortcut(intent: intent)
    }
}

struct IntentView_Previews: PreviewProvider {
    static var previews: some View {
        IntentView(text: "default")
    }
}
