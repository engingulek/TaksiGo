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
        let interator = HomeInteractor()
        let presenter : ViewToPrensenterHomeProtocol & InteractorToPresenterHomeProtocol =
        HomePresenter(view: viewController,intetactor: interator)
        viewController.presenter = presenter
        interator.presenter = presenter
        return viewController
    }
}
