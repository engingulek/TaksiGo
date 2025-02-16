//
//  OnboardingProtocols.swift
//  OnboardingModule
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import UIKit
import ViewControllerAbleKit
typealias Kits = UIViewAble & SegueAble

//MARK: ViewToPrensenterOnboardingProtocol
protocol ViewToPrensenterOnboardingProtocol{
    var view : PresenterToViewOnboardingProtocol? {get}
    func viewDidLoad()
    func onTappedStartButton()
}

//MARK: PresenterToViewOnboardingProtocol
protocol PresenterToViewOnboardingProtocol: AnyObject,Kits{
    func setOnboardingContract(contract : OnboardingContract)
}

//MARK: PresenterToRouterOnboardingProtocol
protocol PresenterToRouterOnboardingProtocol {
    func toPhoneNumberConfirm(view:PresenterToViewOnboardingProtocol?)
}

//MARK: OnboardingModuleProtocol
public protocol OnboardingModuleProtocol {
    func createModule() -> UIViewController
}


//MARK: PresenterToInteractorOnboardingProtocol
/*protocol PresenterToInteractorOnboardingProtocol{
 
 }*/

//MARK: InteractorToPresenterOnboardingProtocol
/*protocol InteractorToPresenterOnboardingProtocol{
 
 }*/
