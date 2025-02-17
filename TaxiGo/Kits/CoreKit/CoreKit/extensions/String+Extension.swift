//
//  String+Extension.swift
//  CoreKit
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation

extension String {
   public func isValisPhoneNumber(number:String,regex:String) -> Bool {
        return number.range(of: regex, options: .regularExpression) != nil
    }
}
