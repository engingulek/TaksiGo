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
    lazy var presenter : ViewToPrensenterConfirmCodeProtocol = 
    ConfirmCodePresenter(view: self, router: ConfirmCodeRouter(),interactor: ConfirmInteractor())
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
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            confirmCodeView.setCodeErrorState(error: error)
        }
    }
    
    // Made for DispatchQueue.main.async
    func toHomePage() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            presenter.toHomePagePresenter()
        }
    }
    
}
