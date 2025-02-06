//
//  LocationManager.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation
import CoreLocation
import MapKit


protocol LocationManagerDelegate: AnyObject {
    func didUpdateLocation(location:(latitude:Double,longitude:Double))
    func didFailWithError(_ error: Error)
}


class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    weak var delegate: LocationManagerDelegate?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    
    private  func fetchLocationInfo(location: CLLocation, completion: @escaping ((state:Bool,text:String)) -> Void)  {
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
    
    func getLocationInfo(location: (latitude: Double, longitude: Double), completion: @escaping (Bool, String) -> Void) {
        fetchLocationInfo(location: CLLocation(latitude: location.latitude, longitude: location.longitude)) { (state, text) in
            completion(state, text)
        }
    }
}


extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {return}
        let location = (latitude:lastLocation.coordinate.latitude,
                        longitude:lastLocation.coordinate.longitude)
        delegate?.didUpdateLocation(location: location)
    }
    
}
