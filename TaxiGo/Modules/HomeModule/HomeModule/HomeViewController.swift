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
    lazy var presenter : ViewToPrensenterHomeProtocol = HomePresenter(view:self)
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view = homeView
        homeView.presenter = presenter
        presenter.viewDidLoad()
    }
}


extension HomeViewController : PresenterToViewHomeProtocol {
    func locationInfo(state: Bool, text: String) {
        homeView.setLocationInfo(state: state, text: text)
    }
    

    func updateLocation(location: (latitude: Double, longitude: Double),meters:Double) {
        homeView.showUserLocation(location: location,meters: meters)
    }
    
}
