//
//  OnboardingViewController.swift
//  OnboardingModule
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import SnapKit
import UIKit
class OnboardingViewController : UIViewController {
    
    private lazy var onboardingView = OnboardingView(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        view = onboardingView
        view.backgroundColor = .white
    }
}

