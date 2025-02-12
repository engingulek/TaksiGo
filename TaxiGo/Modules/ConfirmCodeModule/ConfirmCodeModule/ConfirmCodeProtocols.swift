//
//  ConfirmModuleProtocols.swift
//  ConfirmCodeModule
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import UIKit
import ViewControllerAbleKit

typealias Kits = UIViewAble & SegueAble

//MARK: ViewToPrensenterConfirmCodeProtocol
protocol ViewToPrensenterConfirmCodeProtocol{
    var view : PresenterToViewConfirmCodeProtocol? {get}
    func viewDidLoad()
    func getPhoneNumber(_ number:String)
    func onTappedConfirmCode(code:String)    
    func toHomePagePresenter()
}

//MARK: PresenterToViewConfirmCodeProtocol
protocol PresenterToViewConfirmCodeProtocol: AnyObject,Kits{
    func setTitleContract(contract:TitleContract)
    func setCodeErrorState(error:(errorState:Bool,text:String,borderColor:String))
    func toHomePage()
  
}

//MARK: PresenterToInteractorConfirmCodeProtocol
protocol PresenterToInteractorConfirmCodeProtocol{
   func fetchConfirmCode(parameter:[String:Any]) async
}

//MARK: InteractorToPresenterConfirmCodeProtocol
protocol InteractorToPresenterConfirmCodeProtocol{
    func sendConfirmCode(state:Bool)
    func confirmCodeError()
}

//MARK: PresenterToRouterConfirmCodeProtocol
protocol PresenterToRouterConfirmCodeProtocol {
    func toHomeModule(view:PresenterToViewConfirmCodeProtocol?)
}





//MARK: ConfirmModuleProtocol
public protocol ConfirmModuleProtocol {
    func createModule(phoneNumber:String) -> UIViewController
}
