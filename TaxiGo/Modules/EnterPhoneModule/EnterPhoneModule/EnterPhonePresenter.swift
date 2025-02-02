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
    
    init(view: PresenterToViewEnterPhoneProtocol?, 
         router: PresenterToRouterEnterPhoneProtocol,
         interactor : PresenterToInteractorEnterPhoneProtocol
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


//MARK: EnterPhonePresenter : ViewToPrensenterEnterPhoneProtocol
extension EnterPhonePresenter : ViewToPrensenterEnterPhoneProtocol {

    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.changeColorNavigaiton()
        let titleContract = TitleContract(
            enterPhoneTitle: TextTheme.enterPhoneNumber.localized,
            countryTitle: TextTheme.countryTitle.localized,
            phoneNumberTitle: TextTheme.phoneNumber.localized
        )
        
        view?.setEnterPhoneTitleContract(titleContract: titleContract)
        
        interactor.fetchCountryAndFlagList()
    }
    
    func onTappedContiuneButton() {
        router.toConfirmCode()
    }
    
    
    func selectedCounryNumber(country: CountryNumber) {
        view?.updateCountryPhone(countryPhone: country)
    }
  
}

extension EnterPhonePresenter : InteractorToPresenterEnterPhoneProtocol {
    func sendCountryAndFlagList(list: [CountryNumber]) {
    
        view?.setCountryAndFlagList(list: list)
    }

}
