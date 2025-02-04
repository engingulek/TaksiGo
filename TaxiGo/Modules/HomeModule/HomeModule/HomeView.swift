//
//  HomeModuleView.swift
//  HomeModule
//
//  Created by Engin Gülek on 4.02.2025.
//

import Foundation
import BaseViewKit
import FactoryKit
import UIKit
import MapKit
import SnapKit
import CoreLocation
import CoreKit



class HomeView : BaseView<HomeViewController>,CLLocationManagerDelegate {
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    private let locationInfo = LabelFactory.createLabel(ofType: .mediumTitleLabel(false))
    private lazy var loadingAction = UIActivityIndicatorView.createActivityIndicator()
    
    
    override func setupView() {
        super.setupView()
        
        configureView()
        
    }
    
    private func configureView() {
        addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
        
        mapView.addSubview(locationInfo)
        locationInfo.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(40)
        }
        locationInfo.backgroundColor = .white
        locationInfo.textAlignment = .center
        locationInfo.layer.cornerRadius = 15
        addSubview(loadingAction)
        loadingAction.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.centerX.equalToSuperview()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocationn = locations.last else { return }
        
        let region = MKCoordinateRegion(
            center: userLocationn.coordinate,
            latitudinalMeters: 200,
            longitudinalMeters: 200
        )
        mapView.setRegion(region, animated: true)
        
        loadingAction.startAnimating()
        fetchLocationInfo(location: userLocationn) { neighborhood in
            self.locationInfo.text = "Your Location \(neighborhood) Street "
            self.loadingAction.stopAnimating()
        }
        
    }
    
    
    private func fetchLocationInfo(location: CLLocation, completion: @escaping (String) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                completion("No location data found")
                return
            }
            guard let placemarkInfo = placemarks?.last else {
                completion("No location data found")
                return
            }
            let neighborhood = placemarkInfo.subLocality ?? "Unknown"
            completion(neighborhood)
            
        }
    }
}
