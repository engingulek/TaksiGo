//
//  EnterPhoneViewController.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation
import UIKit

class EnterPhoneViewController : UIViewController {
    lazy var presenter : ViewToPrensenterEnterPhoneProtocol = EnterPhonePresenter(
        view: self,
        router: EnterPhoneRouter(), interactor: EnterPhoneInteractor())
    private lazy var enterPhoneView = EnterPhoneView(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        view = enterPhoneView
        enterPhoneView.presenter = presenter
        presenter.viewDidLoad()
        
    }
}

extension EnterPhoneViewController : PresenterToViewEnterPhoneProtocol {
  

    func setEnterPhoneTitleContract(titleContract: TitleContract) {
        enterPhoneView.configureTitleContract(titleContract: titleContract)
    }
    
    func setCountryAndFlagList(list: [CountryNumber]) {
        enterPhoneView.setCountryAndFlagList(list: list)
    }
    
    
    func updateCountryPhone(countryPhone: CountryNumber) {
        enterPhoneView.updateCountryPhone(countryPhone: countryPhone)
    }
    
    func phoneNumberState(error: (errorState: Bool, text: String, buttonBackColor: String)) {
        enterPhoneView.setError(error: error)
    }
}

