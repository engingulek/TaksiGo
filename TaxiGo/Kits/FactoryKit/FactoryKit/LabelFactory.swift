//
//  LabelFactory.swift
//  FactoryKit
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import UIKit
public enum LabelType {
    /// is boldSystemFont:30
    case bannerLabel
    case subbannerLabel
    
}


public struct LabelFactory {
    
   public static func createLabel(ofType type: LabelType) -> UILabel {
        let label = UILabel()
        switch type {
        case .bannerLabel:
            label.font = .boldSystemFont(ofSize: 30)
            label.textColor = .black
            
        case .subbannerLabel:
            label.font = .systemFont(ofSize: 20)
            label.numberOfLines = 3
            label.textAlignment = .center
            label.textColor = .black
        }
        return label
    }
}


//TODO: This will be module
extension UIColor {
   public convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}

