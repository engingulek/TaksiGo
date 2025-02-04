//
//  HomeViewController.swift
//  HomeModule
//
//  Created by Engin Gülek on 4.02.2025.
//

import Foundation
import UIKit
class HomeViewController : UIViewController {
    private lazy var homeView = HomeView(self)
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view = homeView
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
    }
}
