//
//  OnboardingRouter.swift
//  OnboardingModule
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import UIKit

public class OnboardingRouter : OnboardingModuleProtocol {
    public init() {}
    public func createModule() -> UIViewController {
        let viewController = OnboardingViewController()
        return viewController
    }
}
