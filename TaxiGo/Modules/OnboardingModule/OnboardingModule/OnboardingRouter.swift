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
        let router  = OnboardingRouter()
        let presenter : ViewToPrensenterOnboardingProtocol = OnboardingPresenter(
            view: viewController,
            router: router)
        viewController.presenter = presenter
        return viewController
    }
}

extension OnboardingRouter : PresenterToRouterOnboardingProtocol {
    func toPhoneNumberConfirm() {
        print("To Phone Access")
    }
}
