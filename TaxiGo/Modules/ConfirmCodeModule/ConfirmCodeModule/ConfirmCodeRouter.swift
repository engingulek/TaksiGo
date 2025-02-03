//
//  ConfirmCodeRouter.swift
//  ConfirmCodeModule
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import UIKit
public class ConfirmCodeRouter : ConfirmModuleProtocol {
    public init() {}
    public func createModule(phoneNumber:String) -> UIViewController {
        let viewController = ConfirmCodeViewController()
        let router = ConfirmCodeRouter()
        let presenter : ViewToPrensenterConfirmCodeProtocol = ConfirmCodePresenter(view: viewController, router: router)
        viewController.presenter = presenter
        presenter.getPhoneNumber(phoneNumber)
        return viewController
    }
}

extension ConfirmCodeRouter : PresenterToRouterConfirmCodeProtocol {
    func toHomeModule(view: PresenterToViewConfirmCodeProtocol?) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        view?.pushViewControllerAble(viewController, animated: true)
    }
}
