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
    private var intetactor : PresenterToInteractorHomeProtocol
    private var userLocation : (latitude: Double, longitude: Double)?
    private var selectedLocation: (latitude: Double, longitude: Double)?
    private var taxiTypelist:[TaxiType] = []
    private var locationManagerDelegate = LocationManager()
    
    init(view: PresenterToViewHomeProtocol?,intetactor:PresenterToInteractorHomeProtocol) {
        self.view = view
        self.intetactor = intetactor
        locationManagerDelegate.delegate = self
    }
    
    func didUpdateLocation(location: (latitude: Double, longitude: Double)) {
        userLocation = location
        guard let userLocation = userLocation else {return}
        view?.updateLocation(location: userLocation,meters: 200)
        
        locationManagerDelegate.getLocationInfo(location: userLocation) { state, text in
            let street = "\(text) \(TextTheme.street.localized)"
            self.view?.locationInfo(state: state, text: state ? "" : street)
            self.view?.errorState(state: state, 
                                  errorMessage: state ? TextTheme.errorMessageOne.localized : TextTheme.defaultEmpty.localized)
        }
    }

    func didFailWithError(_ error: Error) {
        self.view?.errorState(state: true, errorMessage: TextTheme.errorMessageOne.localized)
    }
}

extension HomePresenter: ViewToPrensenterHomeProtocol {
    func numberOfItemsIn() -> Int {
        return taxiTypelist.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> TaxiType {
        return taxiTypelist[indexPath.item]
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        let horizontalPadding: CGFloat = 10
        let totalSpacing = (2 * horizontalPadding)
        let itemWidth = (width - totalSpacing)
        return CGSize(width: itemWidth, height: 50)
    }
    
   
    
    func insetForSectionAt() -> (top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) {
        return (top: 10, left: 10, right: 10, bottom: 10)
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.stateBackAction(state: true)
        intetactor.fetchTaxiInfo()
        let titleContract = TitleContract(buttonTitle: TextTheme.sendTaxi.localized)
        view?.titleContract(title: titleContract)
    }
    
    func mapMove(location: (latitude: Double, longitude: Double)) {
      selectedLocation = location
        guard let selectedLocation = selectedLocation else {return}
        locationManagerDelegate.getLocationInfo(location: selectedLocation) { state, text in
            let street = "\(text) \(TextTheme.street.localized)"
            self.view?.locationInfo(state: state, text: state ? "" : street)
            self.view?.errorState(state: state, errorMessage: state ? TextTheme.errorMessageOne.localized : TextTheme.defaultEmpty.localized)
        }
    }
}


extension HomePresenter : InteractorToPresenterHomeProtocol {
    func sendTaxiTypes(list: [TaxiType]) {
        taxiTypelist = list
    }
}

