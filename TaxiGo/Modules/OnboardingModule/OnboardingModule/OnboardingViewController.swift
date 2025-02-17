//
//  OnboardingViewController.swift
//  OnboardingModule
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import SnapKit
import UIKit
class OnboardingViewController : UIViewController{
    
    lazy var presenter : ViewToPrensenterOnboardingProtocol = OnboardingPresenter(
        view: self, router: OnboardingRouter())
    private lazy var onboardingView = OnboardingView(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = onboardingView
        onboardingView.presenter = presenter
        presenter.viewDidLoad()
    }
}


extension OnboardingViewController : PresenterToViewOnboardingProtocol {
    func setOnboardingContract(contract: OnboardingContract) {
        onboardingView.configureData(contract: contract)
    }
}

