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

import CoreKit

class MapUIView : UIView{
     var presenter : ViewToPrensenterHomeProtocol?
    private let mapView = MKMapView()
    private let locationInfo = LabelFactory.createLabel(ofType: .smallTitleLabel(false))
    private lazy var arrowDownIcon = IconFactory.createIcon(ofType: .bottomArrow)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        mapView.delegate = self
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
      
        
        addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
         
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
}


extension MapUIView : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let centerCoordinate = mapView.centerCoordinate
        presenter?.mapMove(location: (latitude: centerCoordinate.latitude, longitude: centerCoordinate.latitude))
    }
}

//MARK: MapUIViewAbles
extension MapUIView {
    
    func ableFuncs(able:MapUIViewAbles) {
        switch able {
        case .setLocationInfo(let state, let text):
            setLocationInfo(state: state, text: text)
        case .updateLocation(let location, let meters):
            showUserLocation(location: (latitude: location.0, longitude: location.1), meters: meters)
        case .errorState(let state, let text):
            errorState(state: state, errorMessage: text)
        }
    }
    
    
    
   private func showUserLocation(location: (latitude: Double, longitude: Double),meters:Double) {
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude),
            latitudinalMeters: meters,
            longitudinalMeters: meters
        )
        mapView.setRegion(region, animated: true)
    }
   private func setLocationInfo(state:Bool,text:String) {
       
        self.locationInfo.isHidden = state
        self.locationInfo.text = text
        
    }
    
   private func errorState(state: Bool, errorMessage: String){
    }
}
