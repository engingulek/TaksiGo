//
//  TextTheme.swift
//  CoreKit
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation

public enum TextTheme :String {
    case bannerTitle
    case subbannerTitle
    case onboardingButtonTitle
    
    
   public var localized: String {
           switch self {
           case .bannerTitle:
               return NSLocalizedString("banner",comment: "banner text")
           case .subbannerTitle:
               return NSLocalizedString("subbanner", comment: "subbanner test")
           case .onboardingButtonTitle:
               return NSLocalizedString("startButtonTitle",
                                        comment: "start button title")
           }
       }
}
