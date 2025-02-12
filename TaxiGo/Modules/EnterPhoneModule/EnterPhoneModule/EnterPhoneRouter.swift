//
//  EnterPhoneRouter.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation
import UIKit
import ConfirmCodeModule
import DependencyKit

public class EnterPhoneRouter : EnterPhoneModuleProtocol {

    public init() {}
    
    public func createModule() -> UIViewController {
        let viewController = EnterPhoneViewController()
        let router = EnterPhoneRouter()
        let interactor = EnterPhoneInteractor()
        let presenter : ViewToPrensenterEnterPhoneProtocol & InteractorToPresenterEnterPhoneProtocol =
        EnterPhonePresenter(view: viewController,
                            router: router,
                            interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        return viewController
    }
}


extension EnterPhoneRouter : PresenterToRouterEnterPhoneProtocol {
    func toConfirmCode(view:PresenterToViewEnterPhoneProtocol?,phoneNumber:String) {
        let confirmCodeModule : ConfirmModuleProtocol =
        DependencyRegister.shared.resolve(ConfirmModuleProtocol.self)
        let viewController = confirmCodeModule.createModule(phoneNumber: phoneNumber)
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    
}
