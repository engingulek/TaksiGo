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
    private var phoneNumber :String = ""
    init(view: PresenterToViewConfirmCodeProtocol?, router: PresenterToRouterConfirmCodeProtocol) {
        self.view = view
        self.router = router
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
        let defaultCode = "21443"
        if code != defaultCode {
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
