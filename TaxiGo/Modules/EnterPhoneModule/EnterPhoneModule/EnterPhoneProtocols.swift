//
//  EnterPhoneProtocols.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation
import UIKit
import ViewControllerAbleKit
typealias Kits = UIViewAble & SegueAble & NavigationDesing & AlertMessageAble



//MARK: ViewToPrensenterEnterPhoneProtocol
protocol ViewToPrensenterEnterPhoneProtocol{
    var view : PresenterToViewEnterPhoneProtocol? {get}
    func viewDidLoad()
    func onTappedContiuneButton()
    func selectedCounryNumber(country:CountryNumber)
    func phoneNumberTextFieldChanged(text:String?)
    func toConfirmCodePresenter()
   
    
    
}

//MARK: PresenterToViewEnterPhoneProtocol
protocol PresenterToViewEnterPhoneProtocol: AnyObject,Kits{
    func setEnterPhoneTitleContract(titleContract:Contract)
   
    func updateCountryPhone(countryPhone:CountryNumber)
    func phoneNumberState(error:(errorState:Bool,text:String,buttonBackColor:String))
 
    func toConfirmCodeScreen()
   
  
}

//MARK: PresenterToInteractorEnterPhoneProtocol
protocol PresenterToInteractorEnterPhoneProtocol{
    func createConfirmCode(paramenter: [String:Any]) async
}

//MARK: InteractorToPresenterEnterPhoneProtocol
protocol InteractorToPresenterEnterPhoneProtocol{
    
    func interactorError()
    func interactorSucccess()
}

//MARK: PresenterToRouterEnterPhoneProtocol
protocol PresenterToRouterEnterPhoneProtocol {
    func toConfirmCode(view:PresenterToViewEnterPhoneProtocol?,phoneNumber:String)
}


//MARK: EnterPhoneModuleProtocol
public protocol EnterPhoneModuleProtocol {
    func createModule() -> UIViewController
}
