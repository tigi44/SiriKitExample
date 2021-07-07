//
//  UserActivityShortcutsManager.swift
//  SiriKitExample
//
//  Created by tigi KIM on 2021/07/07.
//

import Intents

final class UserActivityShortcutsManager {
        
    public enum Shortcut: CaseIterable {
        case redview
        case blueview
        
        var type: String {
            
            switch self {
            case .redview:
                return "com.tigi44.shortcuts.redview"
            case .blueview:
                return "com.tigi44.shortcuts.blueview"
            }
        }
        
        var title: String {
            
            switch self {
            case .redview:
                return "레드뷰 실행"
            case .blueview:
                return "블루뷰 실행"
            }
        }
        
        var invocationPhrase: String {
            
            switch self {
            case .redview:
                return "레드뷰 보여줘"
            case .blueview:
                return "블루뷰 보여줘"
            }
        }
        
        var userActivity: NSUserActivity {
            
            let userActivity = NSUserActivity(activityType: self.type)
            userActivity.title = self.title
            userActivity.suggestedInvocationPhrase = self.invocationPhrase
            
            return userActivity
        }
        
        func makeShortcut() -> INShortcut {
            return INShortcut(userActivity: self.userActivity)
        }
    }
    
    static func setup() {
        
        var shortcuts: [INShortcut] = []
        
        for shortcut in Shortcut.allCases {
            shortcuts.append(shortcut.makeShortcut())
        }
        
        INVoiceShortcutCenter.shared.setShortcutSuggestions(shortcuts)
        
        print("complete setup INVoiceShortcutCenter")
    }
}
