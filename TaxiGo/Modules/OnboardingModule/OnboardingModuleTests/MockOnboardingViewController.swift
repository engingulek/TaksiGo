//
//  MockOnboardingViewController.swift
//  OnboardingModuleTests
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import UIKit
@testable import OnboardingModule

class MockOnboardingViewController : PresenterToViewOnboardingProtocol {

    
    var invokedsetOnboardingContract:Bool = false
    var invokedsetOnboardingContractCount:Int = 0
    var invokedsetOnboardingContractData = [(contract:OnboardingModule.OnboardingContract,Void)]()
    func setOnboardingContract(contract: OnboardingModule.OnboardingContract) {
        invokedsetOnboardingContract = true
        invokedsetOnboardingContractCount += 1
        invokedsetOnboardingContractData.append((contract:contract,()))
    }
    
    var invokedsetBackColorAble:Bool = false
    var invokedsetBackColorAbleCount:Int = 0
    var invokedsetBackColorAbleData = [(color:String,Void)]()
    func setBackColorAble(color: String) {
        invokedsetBackColorAble = true
        invokedsetBackColorAbleCount += 1
        invokedsetBackColorAbleData.append((color:color,()))
    }
    
    
    var invokedpushViewControllerAble:Bool = false
    var invoedkpushViewControllerAblecCount:Int = 0
    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {
         invokedpushViewControllerAble = true
         invoedkpushViewControllerAblecCount += 1
    }
}
