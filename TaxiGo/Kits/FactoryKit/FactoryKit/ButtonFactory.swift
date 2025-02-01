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
    
}


public struct ButtonFactory {
 public   static func createButton(ofType type: ButtonType) -> UIButton {
        let button = UIButton()
        switch type {
        case .basic(let action):
            button.titleLabel?.font = .systemFont(ofSize: 20)
            button.layer.cornerRadius = 15
            button.layer.borderColor = UIColor.red.cgColor
            button.layer.borderWidth = 1
            button.layer.backgroundColor = UIColor.red.cgColor
            button.addAction(action, for: .touchUpInside)
        }
        
        return button
    }
    
}
