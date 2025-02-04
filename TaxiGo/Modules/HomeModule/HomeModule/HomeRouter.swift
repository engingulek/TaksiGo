//
//  HomerOUTER.swift
//  HomeModule
//
//  Created by Engin Gülek on 4.02.2025.
//

import Foundation
import UIKit

public class HomeRouter : HomeModuleProtocol {
    public init() {}
    public func createModuler() -> UIViewController {
        let viewController = HomeViewController()
        return viewController
    }
    
    
}
