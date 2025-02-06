//
//  HomePresenter.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation
import CoreKit
final class HomePresenter: LocationManagerDelegate {

    
    weak var view:PresenterToViewHomeProtocol?
    private var userLocation : (latitude: Double, longitude: Double)?
    private var selectedLocation: (latitude: Double, longitude: Double)?

    private var locationManagerDelegate = LocationManager()
    
    init(view: PresenterToViewHomeProtocol?) {
        self.view = view
        locationManagerDelegate.delegate = self
    }
    
    func didUpdateLocation(location: (latitude: Double, longitude: Double)) {
        userLocation = location
        guard let userLocation = userLocation else {return}
        view?.updateLocation(location: userLocation,meters: 200)
        locationManagerDelegate.getLocationInfo(location: userLocation) { state, text in
            self.view?.locationInfo(state: state, text: text)
        }
    }

    func didFailWithError(_ error: Error) {
        
    }
    
   
}

extension HomePresenter: ViewToPrensenterHomeProtocol {

    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.stateBackAction(state: true)
    }
    
    func mapMove(location: (latitude: Double, longitude: Double)) {
      selectedLocation = location
        guard let selectedLocation = selectedLocation else {return}
        locationManagerDelegate.getLocationInfo(location: selectedLocation) { state, text in
            self.view?.locationInfo(state: state, text: text)
        }
    }
}

