//
//  EnterPhonePresenter.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation
import CoreKit
final class EnterPhonePresenter {
    weak var view: PresenterToViewEnterPhoneProtocol?
    private var router : PresenterToRouterEnterPhoneProtocol
    private var interactor : PresenterToInteractorEnterPhoneProtocol
    private var enteredPhoneNumber : String = ""
    
    //TODO: This will been gotten from location
    private var selectedCountryNumber = CountryNumber(id: 1,
                                                      phohoneCode: "+90",
                                                      length: 10,
                                                      name: "Türkiye",
                                                      
                                                      phoneFormat: #"^5\d{9}$"#)
    init(view: PresenterToViewEnterPhoneProtocol?,
         router: PresenterToRouterEnterPhoneProtocol,
         interactor : PresenterToInteractorEnterPhoneProtocol
         
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    private func createConfirmCode(enterPhoneNumber:String){
        
        Task {
            let number = enterPhoneNumber.replacingOccurrences(of: " ", with: "")
            let parameter : [String:Any] = ["phoneNumber":number]
            await interactor.createConfirmCode(paramenter:parameter)
        }
    }
}


//MARK: EnterPhonePresenter : ViewToPrensenterEnterPhoneProtocol
extension EnterPhonePresenter : ViewToPrensenterEnterPhoneProtocol {

    func toConfirmCodePresenter() {
        router.toConfirmCode(view: view,phoneNumber: enteredPhoneNumber)
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.changeColorNavigaiton()
        
        let titleContract = Contract(
            enterPhoneTitle: TextTheme.enterPhoneNumber.localized,
            countryTitle: TextTheme.countryTitle.localized,
            phoneNumberTitle: TextTheme.phoneNumber.localized,
            phoneTextFieldPlaceholder: TextTheme.phoneNumber.localized,
            contiuneButtonTitke: TextTheme.countiuneButtonTitle.localized
        )
        
        view?.setEnterPhoneTitleContract(titleContract: titleContract)
        view?.updateCountryPhone(countryPhone: selectedCountryNumber)
        
        
        view?.phoneNumberState(error: (
            errorState: true,
            text: TextTheme.defaultEmpty.localized,
            buttonBackColor: ColorTheme.redAlpha05.rawValue))
        view?.stateBackAction(state: false)
    }
}

//MARK: EnterPhonePresenter - OnAction
extension EnterPhonePresenter {
    func onAction(action:EnterPhoneActionType) {
        switch action {
        case .tappedContinueButton:
            createConfirmCode(enterPhoneNumber: enteredPhoneNumber)
        case .selectedCountryNumber(let countryNumber):
            view?.updateCountryPhone(countryPhone: countryNumber)
        case .phoneNumberTextFieldChanged(let text):
            phoneNumberTextFieldChanged(text: text)
        }
    }
    
    /// control phone number
    private  func phoneNumberTextFieldChanged(text: String?) {
        guard let text = text else { return }
        
        let characterSet = CharacterSet.letters
        let phoneNumberLength = selectedCountryNumber.length
        
        if text.count > phoneNumberLength {
            view?.phoneNumberState(error: (
                errorState: true,
                text: TextTheme.numberTooLong.localized,
                buttonBackColor: ColorTheme.redAlpha05.rawValue))
            
        } else if text.count == phoneNumberLength {
            let isValidNumber = text.isValisPhoneNumber(number: text, regex: selectedCountryNumber.phoneFormat)
            let containsLetters = text.rangeOfCharacter(from: characterSet) != nil
            if !isValidNumber || containsLetters {
                view?.phoneNumberState(error: (
                    errorState: true,
                    text: TextTheme.checkNumber.localized,
                    buttonBackColor: ColorTheme.redAlpha05.rawValue))
                
            } else {
                view?.phoneNumberState(error: (
                    errorState: false,
                    text: TextTheme.defaultEmpty.localized,
                    buttonBackColor: ColorTheme.red.rawValue))
                let code = selectedCountryNumber.phohoneCode
                let phoneNumber = text
                enteredPhoneNumber = "\(code) \(phoneNumber)"
            }
        }
    }
}

extension EnterPhonePresenter : InteractorToPresenterEnterPhoneProtocol {
    
    func interactorSucccess() {
        view?.toConfirmCodeScreen()
    }
    
    func interactorError() {
        view?.createAlertMesssage(
            title: TextTheme.errorTitle.localized,
            message: TextTheme.errorMessageOne.localized,
            actionTitle: TextTheme.ok.localized)
    }
}
