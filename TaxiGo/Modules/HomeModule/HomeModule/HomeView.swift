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
    private let locationInfo = LabelFactory.createLabel(ofType: .smallTitleLabel)
    private lazy var loadingAction = UIActivityIndicatorView.createActivityIndicator()
    private lazy var arrowDownIcon = IconFactory.createIcon(ofType: .bottomArrow)
    private var selectedLocation:  CLLocationCoordinate2D?
    private var userLocation:CLLocation?
    private lazy var toUserLocationIcon = IconFactory.createIcon(ofType: .userLocation)
 
    
    
    override func setupView() {
        super.setupView()
        mapView.delegate = self
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
           
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        locationInfo.backgroundColor = .white
        locationInfo.textAlignment = .center
      
        locationInfo.numberOfLines = 1
        locationInfo.sizeToFit()
        
        locationInfo.addSubview(loadingAction)
        loadingAction.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        mapView.addSubview(arrowDownIcon)
        arrowDownIcon.snp.makeConstraints { make in
            make.top.equalTo(locationInfo.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        addSubview(toUserLocationIcon)
        toUserLocationIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.last
        showUserLocation()
    }
    
    
    func showUserLocation() {
        guard let userLocationn = userLocation else { return }
        
        let region = MKCoordinateRegion(
            center: userLocationn.coordinate,
            latitudinalMeters: 200,
            longitudinalMeters: 200
        )
        mapView.setRegion(region, animated: true)
        loadingAction.startAnimating()
        updateLocationInfo(locaiton: userLocationn)
    }
    
    private func fetchLocationInfo(location: CLLocation, completion: @escaping ((state:Bool,text:String)) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            
          
            guard let placemarkInfo = placemarks?.last else {
                completion((state:true,text:"Errro"))
                return
            }
            let neighborhood = placemarkInfo.subLocality ?? "Unknown"
            let state = neighborhood == "Unknown"
            completion((state:state,text:neighborhood))
            
        }
    }
    
    private func updateLocationInfo(locaiton:CLLocation) {
        loadingAction.startAnimating()
        fetchLocationInfo(location: locaiton) { result in
            self.locationInfo.isHidden = result.state
            self.locationInfo.text = "\(result.text) Street "
            self.loadingAction.stopAnimating()
        }
    }
}


extension HomeView : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let centerCoordinate = mapView.centerCoordinate
        selectedLocation = centerCoordinate
        guard let location = selectedLocation else {return}
        updateLocationInfo(locaiton: CLLocation(latitude: location.latitude, longitude: location.longitude))
    }
}
