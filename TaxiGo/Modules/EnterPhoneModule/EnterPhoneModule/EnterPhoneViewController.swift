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
        router: EnterPhoneRouter())
    private lazy var enterPhoneView = EnterPhoneView(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        view = enterPhoneView
        presenter.viewDidLoad()
        enterPhoneView.presenter = presenter
       
    }
}

extension EnterPhoneViewController : PresenterToViewEnterPhoneProtocol {
  

    func setEnterPhoneTitleContract(titleContract: Contract) {
        enterPhoneView.configureTitleContract(titleContract: titleContract)
    }
    
    func updateCountryPhone(countryPhone: CountryNumber) {
        enterPhoneView.updateCountryPhone(countryPhone: countryPhone)
    }
    
    func phoneNumberState(
        error: (
            errorState: Bool,
            text: String,
            buttonBackColor: String)) {
        enterPhoneView.setError(error: error)
    }
}

