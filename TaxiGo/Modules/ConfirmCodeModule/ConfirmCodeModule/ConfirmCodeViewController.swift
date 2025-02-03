//
//  ConfirmCodeViewController.swift
//  ConfirmCodeModule
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import UIKit
import SnapKit
class ConfirmCodeViewController : UIViewController, UITextFieldDelegate {
    lazy var presenter : ViewToPrensenterConfirmCodeProtocol = ConfirmCodePresenter(view: self, router: ConfirmCodeRouter())
    private lazy var confirmCodeView = ConfirmCodeView(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = confirmCodeView
        presenter.viewDidLoad()
        confirmCodeView.presenter = presenter
      
    }
}

extension ConfirmCodeViewController : PresenterToViewConfirmCodeProtocol {

    func setTitleContract(contract: TitleContract) {
        confirmCodeView.setTitleContract(contract)
    }
    
    
    func setCodeErrorState(error: (errorState: Bool, text: String, borderColor: String)) {
        confirmCodeView.setCodeErrorState(error: error)
    }
}
