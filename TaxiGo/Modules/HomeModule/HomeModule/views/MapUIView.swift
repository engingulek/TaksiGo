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

class MapUIView : BaseView<HomeViewController>{
    var presenter : ViewToPrensenterHomeProtocol?
    private let mapView = MKMapView()
    private let locationInfo = LabelFactory.createLabel(ofType: .smallTitleLabel(false))
    private lazy var arrowDownIcon = IconFactory.createIcon(ofType: .bottomArrow)
    private lazy var userLocationButtonIcon = ButtonFactory.createButton(
        ofType: .iconButton(action: userLocationButtonIconAction,
                            icon: "location.square.fill"))
    
    private lazy var userLocationButtonIconAction  : UIAction = UIAction { _ in
        self.presenter?.toUserLocation()
    }

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
        mapView.addSubview(userLocationButtonIcon)
        userLocationButtonIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-20)
           
        }
    }
}

extension MapUIView : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let centerCoordinate = mapView.centerCoordinate
        presenter?.mapMove(location: (latitude: centerCoordinate.latitude, longitude: centerCoordinate.longitude))
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil } 
        
        guard let customAnnotation = annotation as? CustomAnnotation else { return nil }
        
        let identifier = "customPin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        annotationView?.updateConstraints()
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
       
        annotationView?.image = UIImage(resource: customAnnotation.image)
        
        annotationView?.snp.makeConstraints({ make in
            make.size.equalTo(40)
        })
        
        return annotationView
    }
    
    func addCustomAnnotations(list:[TaxiInfoElement]) {
        for location in list {
            
            let annotation = CustomAnnotation(
                title:"",
                coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude),
                image: location.taxiTypeName == "yellow" ? .yellowTaxi : .blackTaxi)
            
            mapView.addAnnotation(annotation)
      
        }
    }
    
    func removeAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
       
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
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
    
    
}
