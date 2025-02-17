//
//  ConfirmCodePresenter.swift
//  ConfirmCodeModule
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import CoreKit
import UserDefaultsManagerKit
final class ConfirmCodePresenter {
    weak var view : PresenterToViewConfirmCodeProtocol?
    private var router : PresenterToRouterConfirmCodeProtocol
    private let interactor : PresenterToInteractorConfirmCodeProtocol
    private var phoneNumber :String = ""
    private let userDefaultManager : UserDefaultsManagerProtocol = UserSessionManager()
    init(view: PresenterToViewConfirmCodeProtocol?,
         router: PresenterToRouterConfirmCodeProtocol,
         interactor : PresenterToInteractorConfirmCodeProtocol
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

//MARK: ViewToPrensenterConfirmCodeProtocol
extension ConfirmCodePresenter : ViewToPrensenterConfirmCodeProtocol {

    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        let titleContract = TitleContract(
            title: TextTheme.confirmTitle.localized,
            infoPhone: "\(TextTheme.entered.localized) \(phoneNumber)", 
            confirmButtonTitle: TextTheme.confirmButton.localized)
        view?.setTitleContract(contract: titleContract)
        
        view?.setCodeErrorState(error: (
            errorState: true,
            text: TextTheme.defaultEmpty.localized,
            borderColor: ColorTheme.black.rawValue))
    }
    
    func getPhoneNumber(_ number: String) {
        phoneNumber = number
      
    }
    
    func onTappedConfirmCode(code: String) {
        let parameter : [String:Any] = [
            "phoneNumber" : phoneNumber.replacingOccurrences(of: " ", with: ""),
            "code":code
        ]
        Task {
            await interactor.fetchConfirmCode(parameter:parameter)
        }
    }
    
    func toHomePagePresenter() {
        router.toHomeModule(view: view)
    }
}


extension ConfirmCodePresenter : InteractorToPresenterConfirmCodeProtocol {
    func sendConfirmCode(state: Bool) {
        if state  {
            
            view?.setCodeErrorState(error: (
                errorState: false,
                text: TextTheme.defaultEmpty.localized,
                borderColor: ColorTheme.black.rawValue))
            view?.toHomePage()
            
            userDefaultManager.login(phoneNumber: phoneNumber)
        }else{
            view?.setCodeErrorState(error: (
                errorState: true,
                text: TextTheme.codeError.localized,
                borderColor: ColorTheme.red.rawValue))
        }
    }
    
    func confirmCodeError() {
        view?.createAlertMesssage(
            title: TextTheme.errorTitle.localized,
            message: TextTheme.errorMessageOne.localized,
            actionTitle: TextTheme.ok.localized)
    }
}
