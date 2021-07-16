//
//  IntentHandler.swift
//  IntentsExtension
//
//  Created by tigi KIM on 2021/07/16.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}

extension IntentHandler: ReverseTextIntentHandling {
    
    func resolveText(for intent: ReverseTextIntent, with completion: @escaping (ReverseTextTextResolutionResult) -> Void) {
        if let text = intent.text, !text.isEmpty {
            completion(ReverseTextTextResolutionResult.success(with: text))
        } else {
            completion(ReverseTextTextResolutionResult.unsupported(forReason: .noText))
        }
    }
    
    func handle(intent: ReverseTextIntent, completion: @escaping (ReverseTextIntentResponse) -> Void) {
        if let inputText = intent.text {
            let reversedText = String(inputText.reversed())
            completion(ReverseTextIntentResponse.success(reversedText: reversedText))
        } else {
            completion(ReverseTextIntentResponse.failure(error: "The entered text was invalid"))
        }
    }
}
