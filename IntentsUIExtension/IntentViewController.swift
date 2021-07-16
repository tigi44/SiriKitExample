//
//  IntentViewController.swift
//  IntentsUIExtension
//
//  Created by tigi KIM on 2021/07/16.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    let textLabel: UILabel = UILabel()
    let reversedTextLabel: UILabel = UILabel()
    let uppercaseTextLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .black
        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        reversedTextLabel.translatesAutoresizingMaskIntoConstraints = false
        reversedTextLabel.textColor = .green
        view.addSubview(reversedTextLabel)
        NSLayoutConstraint.activate([
            reversedTextLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            reversedTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20)
        ])
        
        uppercaseTextLabel.translatesAutoresizingMaskIntoConstraints = false
        uppercaseTextLabel.textColor = .blue
        view.addSubview(uppercaseTextLabel)
        NSLayoutConstraint.activate([
            uppercaseTextLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            uppercaseTextLabel.topAnchor.constraint(equalTo: reversedTextLabel.bottomAnchor, constant: 20)
        ])
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        
        guard let intent = interaction.intent as? ShowTextUIIntent,
              let response = interaction.intentResponse as? ShowTextUIIntentResponse else {
                completion(true, parameters, .zero)
                return
        }

        if interaction.intentHandlingStatus == .success
        || interaction.intentHandlingStatus == .ready {
            
            textLabel.text = "Input text : \(intent.text ?? "")"
            reversedTextLabel.text = "reversed text : \(response.reversedText ?? "")"
            uppercaseTextLabel.text = "uppercase text : \(response.uppercaseText ?? "")"
            
            completion(true, parameters, desiredSize)
        } else {
            completion(false, parameters, CGSize.zero)
        }
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
