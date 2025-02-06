//
//  MockEnterPhoneViewController.swift
//  EnterPhoneModuleTests
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import UIKit
@testable import EnterPhoneModule

class MockEnterPhoneViewController : PresenterToViewEnterPhoneProtocol {

    
    var invokedsetEnterPhoneTitleContract:Bool = false
    var invokedsetEnterPhoneTitleContractCount:Int = 0
    var invokedsetEnterPhoneTitleContractData = [(contract:EnterPhoneModule.Contract,Void)]()
    func setEnterPhoneTitleContract(titleContract: EnterPhoneModule.Contract) {
        invokedsetEnterPhoneTitleContract = true
        invokedsetEnterPhoneTitleContractCount += 1
        invokedsetEnterPhoneTitleContractData.append((contract:titleContract,()))
    }
    
    //TODO: This will been done when add locaiton
    func updateCountryPhone(countryPhone: EnterPhoneModule.CountryNumber) {
        
    }
    
    var invokePhoneNumberState:Bool = false
    var invoedPhoneNumberStateCount:Int = 0
    var invokedPhoneNumberData = [(error:(
        errorState: Bool, text: String, buttonBackColor: String),Void)]()
    func phoneNumberState(error: (
        errorState: Bool, text: String, buttonBackColor: String)) {
             invokePhoneNumberState = true
             invoedPhoneNumberStateCount += 1
           
            invokedPhoneNumberData.append((error:error,()))
    }
    
    var invokechangeColorNavigaiton:Bool = false
    var invoedkchangeColorNavigaitonCount:Int = 0
    func changeColorNavigaiton() {
        invokechangeColorNavigaiton = true
        invoedkchangeColorNavigaitonCount += 1
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
    
    var invokedstateBackAction:Bool = false
    var invoedkstateBackActionCount:Int = 0
    var invokedstateBackActionData  = [(state:Bool,Void)]()
    func stateBackAction(state: Bool) {
         invokedstateBackAction = true
         invoedkstateBackActionCount += 1
         invokedstateBackActionData.append((state:state,()))
    }
    
    
}
