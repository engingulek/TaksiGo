//
//  DependencyRegister.swift
//  DependencyKit
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import Swinject
import OnboardingModule

public final class DependencyRegister {
   public static let shared = DependencyRegister()
    let container = Container()
    
    private init() {
        registerDependencies()
    }
    
    private func registerDependencies(){
        container.register(OnboardingModuleProtocol.self) { _ in
            OnboardingRouter()
        }
    }
    
   public func resolve<T>(_ type: T.Type) -> T {
        guard let dependency = container.resolve(type) else {
            fatalError("Dependency for \(type) is not registered")
        }
        return dependency
    }
}
