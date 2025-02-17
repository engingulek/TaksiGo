//
//  MockConfirmViewController.swift
//  ConfirmCodeModuleTests
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import UIKit
@testable import ConfirmCodeModule
class MockConfirmViewController : PresenterToViewConfirmCodeProtocol {
  

    var invokedsetTitleContractt:Bool = false
    var invokedsetTitleContractCount:Int = 0
    var invokedsetTitleContractData = [(contract:ConfirmCodeModule.TitleContract,Void)]()
    func setTitleContract(contract: ConfirmCodeModule.TitleContract) {
         invokedsetTitleContractt = true
        invokedsetTitleContractCount += 1
        invokedsetTitleContractData.append((contract: contract, ()))
    }
    
    
    
    var invokeCodeErrorState:Bool = false
    var invoedCodeErrorStateCount:Int = 0
    var invokedCodeErrorStateData = [(error:(
        errorState: Bool, text: String, borderColor: String),Void)]()
    func setCodeErrorState(
        error: (errorState: Bool,
                text: String,
                borderColor: String)) {
        invokeCodeErrorState = true
        invoedCodeErrorStateCount += 1
      
        invokedCodeErrorStateData.append((error:error,()))
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
    
    var invokedCreateAlerMessage:Bool = false
    var invokedCreateAlertMessageCount:Int = 0
    var involedCreateAlertMessageData = [(title: String, message: String, actionTitle: String)]()
    func createAlertMesssage(title: String, message: String, actionTitle: String) {
        invokedCreateAlerMessage = true
        invokedCreateAlertMessageCount += 1
       involedCreateAlertMessageData.append((title: title, message: message, actionTitle: actionTitle))
    }
    
    func toHomePage() {
        
    }
    
    
    
    
    
    
}
