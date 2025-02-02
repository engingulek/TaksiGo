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
    case enterPhoneNumber
    case countryTitle
    case phoneNumber
    case numberTooLong
    case checkNumber
    case defaultEmpty
    case countiuneButtonTitle
    
    
   public var localized: String {
           switch self {
           case .bannerTitle:
               return NSLocalizedString("banner",comment: "banner text")
           case .subbannerTitle:
               return NSLocalizedString("subbanner", comment: "subbanner test")
           case .onboardingButtonTitle:
               return NSLocalizedString("startButtonTitle",
                                        comment: "start button title")
           case .enterPhoneNumber:
               return NSLocalizedString("enterPhoneNumber", comment: "enter phone number text")
           case .countryTitle:
               return NSLocalizedString("countryTitle", comment: "enter phone number text")
           case .phoneNumber:
               return NSLocalizedString("phoneNumber", comment: "phoneNumber text")
           case .numberTooLong:
               return NSLocalizedString("numberTooLong", comment: "numberTooLong text")
           case .checkNumber:
               return NSLocalizedString("controlNumber", comment: "controlNumber text")
           case .countiuneButtonTitle:
               return NSLocalizedString("countiuneButtonTitle", comment: "countiuneButtonTitle text")
           case .defaultEmpty:
               return ""
           }
       }
}
