//
//  SceneDelegate.swift
//  OnboardingApp
//
//  Created by Engin Gülek on 1.02.2025.
//

import UIKit
import OnboardingModule
import DependencyKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let onboardingModule:OnboardingModuleProtocol = DependencyRegister.shared.resolve(OnboardingModuleProtocol.self)
        window?.rootViewController =  onboardingModule.createModule()
        window?.makeKeyAndVisible()
        
    }




}

