//
//  ConfirmCodePresenter.swift
//  ConfirmCodeModule
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import CoreKit
final class ConfirmCodePresenter {
    weak var view : PresenterToViewConfirmCodeProtocol?
    private var router : PresenterToRouterConfirmCodeProtocol
    private let interactor : PresenterToInteractorConfirmCodeProtocol
    private var phoneNumber :String = ""
    private var confirmCode : String?
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
        
        interactor.fetchConfirmCode()
        
        view?.setCodeErrorState(error: (
            errorState: true,
            text: TextTheme.defaultEmpty.localized,
            borderColor: ColorTheme.black.rawValue))
        
       
    }
    
    func getPhoneNumber(_ number: String) {
        phoneNumber = number
       
    }
    
    func onTappedConfirmCode(code: String) {
        guard let confirmCode = confirmCode else {return}
        
        if code != confirmCode {
            view?.setCodeErrorState(error: (
                errorState: true,
                text: TextTheme.codeError.localized,
                borderColor: ColorTheme.red.rawValue))
            
        }else{
            view?.setCodeErrorState(error: (
                errorState: false,
                text: TextTheme.defaultEmpty.localized,
                borderColor: ColorTheme.black.rawValue))
            router.toHomeModule(view: view)
        }
    }
}


extension ConfirmCodePresenter : InteractorToPresenterConfirmCodeProtocol {
    func sendConfirmCode(code: String) {
        confirmCode = code
    }
}
