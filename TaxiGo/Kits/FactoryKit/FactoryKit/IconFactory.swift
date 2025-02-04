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
    case userLocation
}


public struct IconFactory {
   public static func createIcon(ofType type: IconType) -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        
        switch type {
        case .bottomArrow:
            imageView.image = UIImage(systemName: "arrowtriangle.down.fill")?
                .withTintColor(.white, renderingMode: .alwaysOriginal)
        case .userLocation:
            imageView.image = UIImage(systemName: "location.circle.fill")?
                .withTintColor(.black, renderingMode: .alwaysOriginal)
            

        }
        
        return imageView
        
    }
    
    
}
