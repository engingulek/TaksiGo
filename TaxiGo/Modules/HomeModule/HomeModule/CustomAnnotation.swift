//
//  CustomAnnotation.swift
//  HomeModule
//
//  Created by Engin Gülek on 13.02.2025.
//

import Foundation
import MapKit
class CustomAnnotation: NSObject, MKAnnotation {
    
    var title:String?
    var coordinate: CLLocationCoordinate2D
    var image: ImageResource
    
    init(title:String,coordinate: CLLocationCoordinate2D, image: ImageResource) {
        self.title = title
        self.coordinate = coordinate
        self.image = image
    }
}
