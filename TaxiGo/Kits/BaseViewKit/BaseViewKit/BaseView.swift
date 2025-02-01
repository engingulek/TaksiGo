//
//  BaseView.swift
//  BaseViewKit
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import UIKit

open class BaseView<T: UIViewController>: UIView {
    weak var controller: T?
    
   public init(_ controller: T) {
        self.controller = controller
        super.init(frame: .zero)
        
        setupView()
    }
    
   open func setupView() { }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
