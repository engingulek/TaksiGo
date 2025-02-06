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
     var presenter : ViewToPrensenterHomeProtocol?
    private let mapView = MKMapView()
    private let locationInfo = LabelFactory.createLabel(ofType: .smallTitleLabel(false))
    private lazy var arrowDownIcon = IconFactory.createIcon(ofType: .bottomArrow)
    private lazy var subView = SubView()
 
    
    override func setupView() {
        super.setupView()
        mapView.delegate = self
        configureView()
        
        
    }
    
    private func configureView() {
        addSubview(subView)
        subView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 3)
        }
        
        addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(subView.snp.top)
         
        }
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
  
        
        mapView.addSubview(locationInfo)
        locationInfo.snp.makeConstraints { make in
           
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        locationInfo.backgroundColor = .white
        locationInfo.textAlignment = .center
      
        locationInfo.numberOfLines = 1
        locationInfo.sizeToFit()
        
        mapView.addSubview(arrowDownIcon)
        arrowDownIcon.snp.makeConstraints { make in
            make.top.equalTo(locationInfo.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
       
        
    }
    
    func showUserLocation(location: (latitude: Double, longitude: Double),meters:Double) {
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude),
            latitudinalMeters: meters,
            longitudinalMeters: meters
        )
        mapView.setRegion(region, animated: true)
    }
    func setLocationInfo(state:Bool,text:String) {
       
        self.locationInfo.isHidden = state
        self.locationInfo.text = "\(text) Street "
        
    }
    
    
    
}


extension HomeView : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let centerCoordinate = mapView.centerCoordinate
        presenter?.mapMove(location: (latitude: centerCoordinate.latitude, longitude: centerCoordinate.latitude))
    }
}
