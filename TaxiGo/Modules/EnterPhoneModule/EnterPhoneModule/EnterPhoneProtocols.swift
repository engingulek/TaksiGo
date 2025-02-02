//
//  EnterPhoneProtocols.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation
import UIKit
import ViewControllerAbleKit
typealias Kits = UIViewAble & SegueAble & NavigationDesing



//MARK: ViewToPrensenterEnterPhoneProtocol
protocol ViewToPrensenterEnterPhoneProtocol{
    var view : PresenterToViewEnterPhoneProtocol? {get}
    func viewDidLoad()
    func onTappedContiuneButton()
    func selectedCounryNumber(country:CountryNumber)
    
}

//MARK: PresenterToViewEnterPhoneProtocol
protocol PresenterToViewEnterPhoneProtocol: AnyObject,Kits{
    func setEnterPhoneTitleContract(titleContract:TitleContract)
    func setCountryAndFlagList(list:[CountryNumber])
    func updateCountryPhone(countryPhone:CountryNumber)
 
  
}

//MARK: PresenterToInteractorEnterPhoneProtocol
protocol PresenterToInteractorEnterPhoneProtocol{
    func fetchCountryAndFlagList()
}

//MARK: InteractorToPresenterEnterPhoneProtocol
protocol InteractorToPresenterEnterPhoneProtocol{
    func sendCountryAndFlagList(list:[CountryNumber])
}

//MARK: PresenterToRouterEnterPhoneProtocol
protocol PresenterToRouterEnterPhoneProtocol {
    func toConfirmCode()
}



public protocol EnterPhoneModuleProtocol {
    func createModule() -> UIViewController
}
