//
//  EnterPhoneRouter.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation
import UIKit



public class EnterPhoneRouter : EnterPhoneModuleProtocol {

    public init() {}
    
    public func createModule() -> UIViewController {
        let viewController = EnterPhoneViewController()
        let router = EnterPhoneRouter()
       
        let presenter : ViewToPrensenterEnterPhoneProtocol =
        EnterPhonePresenter(view: viewController,
                            router: router)
        viewController.presenter = presenter
      
        return viewController
    }
}


extension EnterPhoneRouter : PresenterToRouterEnterPhoneProtocol {
    func toConfirmCode() {
        print("Selected ToConfirmCode")
    }
    
    
}
