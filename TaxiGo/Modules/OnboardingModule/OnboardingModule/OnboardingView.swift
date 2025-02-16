//
//  OnboardingView.swift
//  OnboardingModule
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import UIKit
import SnapKit
import BaseViewKit
import FactoryKit

class OnboardingView : BaseView<OnboardingViewController> {
    
    var presenter :ViewToPrensenterOnboardingProtocol?
    
    private lazy var onboardingImage : UIImageView = UIImageView()
    private lazy var bannerLabel = LabelFactory.createLabel(ofType: .bannerLabel)
    private lazy var subbannerLabel = LabelFactory.createLabel(ofType: .subbannerLabel)
    private lazy var startButton = ButtonFactory.createButton(ofType: .basic(action: startButtonAction))
    
    private lazy var startButtonAction  : UIAction = UIAction { _ in
        self.presenter?.onTappedStartButton()
    }
    
    override func setupView() {
        super.setupView()
        configureView()
    }
    
    private func configureView() {
        
        addSubview(onboardingImage)
        onboardingImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.size.equalTo(200)
        }
        
        addSubview(bannerLabel)
        bannerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(onboardingImage.snp.bottom).offset(20)
            
        }
        
        addSubview(subbannerLabel)
        subbannerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(bannerLabel.snp.bottom).offset(20)
            
        }
        
        addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
    
    func configureData(contract:OnboardingContract) {
        onboardingImage.image = UIImage(resource: contract.imageTitle)
        bannerLabel.text = contract.bannerTitle
        subbannerLabel.text = contract.subbannerTitle
        startButton.setTitle(contract.buttonTitle,
                             for: .normal)
    }
}
