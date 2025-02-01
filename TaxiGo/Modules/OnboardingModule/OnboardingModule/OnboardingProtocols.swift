//
//  OnboardingProtocols.swift
//  OnboardingModule
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import UIKit
import ViewControllerAbleKit
typealias Kits = UIViewAble

//MARK: ViewToPrensenterOnboardingProtocol
protocol ViewToPrensenterOnboardingProtocol{
    var view : PresenterToViewOnboardingProtocol? {get}
 

  
   
        
}

//MARK: PresenterToViewOnboardingProtocol
protocol PresenterToViewOnboardingProtocol: AnyObject,Kits{
   
 
  
}

//MARK: PresenterToInteractorOnboardingProtocol
protocol PresenterToInteractorOnboardingProtocol{
    
}

//MARK: InteractorToPresenterOnboardingProtocol
protocol InteractorToPresenterOnboardingProtocol{
  
}

//MARK: PresenterToRouterOnboardingProtocol
protocol PresenterToRouterOnboardingProtocol {
   
}

public protocol OnboardingModuleProtocol {
    func createModule() -> UIViewController
}
