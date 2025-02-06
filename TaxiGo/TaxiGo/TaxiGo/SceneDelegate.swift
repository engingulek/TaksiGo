//
//  SceneDelegate.swift
//  TaxiGo
//
//  Created by Engin Gülek on 1.02.2025.
//

import UIKit
import DependencyKit
import OnboardingModule
import EnterPhoneModule
import ConfirmCodeModule
import HomeModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        registerDependencies()
        let onboardingModule:OnboardingModuleProtocol = DependencyRegister.shared.resolve(OnboardingModuleProtocol.self)
        window?.rootViewController =  UINavigationController(rootViewController: onboardingModule.createModule())
        window?.makeKeyAndVisible()
    }

    private func registerDependencies(){
        let container = DependencyRegister.shared.container
        container.register(OnboardingModuleProtocol.self) { _ in
            OnboardingRouter()
        }
        
        container.register(EnterPhoneModuleProtocol.self) { _ in
            EnterPhoneRouter()
        }
        
        
        container.register(ConfirmModuleProtocol.self) { _ in
            ConfirmCodeRouter()
        }
        
        container.register(HomeModuleProtocol.self) { _ in
            HomeRouter()
        }
    }


}

