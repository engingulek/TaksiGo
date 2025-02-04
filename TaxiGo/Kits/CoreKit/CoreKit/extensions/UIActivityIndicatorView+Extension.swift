//
//  UIActivityIndicatorView+Extension.swift
//  CoreKit
//
//  Created by Engin Gülek on 4.02.2025.
//

import Foundation
import UIKit.UIActivityIndicatorView

extension UIActivityIndicatorView {
    static public func createActivityIndicator() ->  UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        activityIndicator.color = .black
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }
}



