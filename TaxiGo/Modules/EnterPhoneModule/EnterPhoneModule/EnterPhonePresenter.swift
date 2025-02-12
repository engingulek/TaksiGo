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
    private var selectedCountryNumber = CountryNumber(  id: 1,
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
            let parameter : [String:Any] = ["phoneNumber":enteredPhoneNumber]
           await interactor.createConfirmCode(paramenter:parameter)
        }
    }
    
  
}


//MARK: EnterPhonePresenter : ViewToPrensenterEnterPhoneProtocol
extension EnterPhonePresenter : ViewToPrensenterEnterPhoneProtocol {
    

    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.changeColorNavigaiton()
        
        let titleContract = Contract(
            enterPhoneTitle: TextTheme.enterPhoneNumber.localized,
            countryTitle: TextTheme.countryTitle.localized,
            phoneNumberTitle: TextTheme.phoneNumber.localized,
            phoneTextFieldPlaceholder: TextTheme.phoneNumber.localized,
            contiuneButtonTitke: TextTheme.countiuneButtonTitle.localized,
            numberList: [    .init(
                id: 1,
                phohoneCode: "+90",
                length: 10,
                name: "Türkiye",
                
                phoneFormat: #"^5\d{9}$"#
            ), .init(
                    id: 2,
                    phohoneCode: "+44",
                    length: 10,
                    name: "UK",
                    
                    phoneFormat:  #"^7\d{9}$"#
                )]
        )
        
        view?.setEnterPhoneTitleContract(titleContract: titleContract)
        view?.updateCountryPhone(countryPhone: selectedCountryNumber)
        
        
        view?.phoneNumberState(error: (
            errorState: true,
            text: TextTheme.defaultEmpty.localized,
            buttonBackColor: ColorTheme.redAlpha05.rawValue))
        view?.stateBackAction(state: false)
    }
    
    func onTappedContiuneButton() {
      
        router.toConfirmCode(view: view,phoneNumber: enteredPhoneNumber)
        
        createConfirmCode(enterPhoneNumber: enteredPhoneNumber)
    }
    
    
    func selectedCounryNumber(country: CountryNumber) {
        view?.updateCountryPhone(countryPhone: country)
    }
    
    func phoneNumberTextFieldChanged(text: String?) {
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

    func interactorError() {
        print("Interacor Error")
    }
    
    
}


