//
//  ButtonFactory.swift
//  FactoryKit
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import UIKit
public enum ButtonType {
    case basic(action:UIAction)
    case iconButton(action:UIAction,icon:String)
}


public struct ButtonFactory {
    public   static func createButton(ofType type: ButtonType) -> UIButton {
        let button = UIButton()
        button.clipsToBounds = true
        switch type {
        case .basic(let action):
            button.titleLabel?.font = .systemFont(ofSize: 20)
            button.layer.cornerRadius = 15
            button.layer.borderColor = UIColor.red.cgColor
            button.layer.borderWidth = 1
            button.layer.backgroundColor = UIColor.red.cgColor
            button.addAction(action, for: .touchUpInside)
        case .iconButton(let action, let icon):
         
            var config = UIButton.Configuration.plain()
            config.image = UIImage(systemName: icon)
            config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 20)
            config.baseForegroundColor = .red
            button.addAction(action, for: .touchUpInside)
            button.configuration = config
        }
        
        return button
    }
    
}
