//
//  OnboardingPresenter.swift
//  OnboardingModule
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import CoreKit

final class OnboardingPresenter {
    
    weak var view : PresenterToViewOnboardingProtocol?
    private var router: PresenterToRouterOnboardingProtocol
    
    init(view: PresenterToViewOnboardingProtocol? ,
         router: PresenterToRouterOnboardingProtocol) {
        self.view = view
        self.router = router
    }
}

//MARK: OnboardingPresenter : ViewToPrensenterOnboardingProtocol
extension OnboardingPresenter : ViewToPrensenterOnboardingProtocol {

    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        let contract = OnboardingContract(
            imageTitle: .onboarding,
            bannerTitle: TextTheme.bannerTitle.localized,
            subbannerTitle: TextTheme.subbannerTitle.localized,
            buttonTitle: TextTheme.onboardingButtonTitle.localized)
        view?.setOnboardingContract(contract: contract)
    }

    func onTappedStartButton() {
        router.toPhoneNumberConfirm(view: view)
    }
}
