//
//  IconFactory.swift
//  FactoryKit
//
//  Created by Engin Gülek on 4.02.2025.
//

import Foundation
import  UIKit
public enum IconType {
    case bottomArrow
    case person
}


public struct IconFactory {
   public static func createIcon(ofType type: IconType) -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        
        switch type {
        case .bottomArrow:
            imageView.image = UIImage(systemName: "arrowtriangle.down.fill")?
                .withTintColor(.white, renderingMode: .alwaysOriginal)
        case .person:
            imageView.image = UIImage(systemName: "person.fill")?
                .withTintColor(.black, renderingMode: .alwaysOriginal)
        }
        
        return imageView
        
    }
    
    
}
