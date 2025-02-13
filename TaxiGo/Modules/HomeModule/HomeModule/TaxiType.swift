//
//  TaxiType.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation

struct TaxiType {
    let imageURL:String
    let taxiTypeName:String
    let seatCount:Int
    let kmPrice:Double
}

struct TaxiInfoElement: Codable {
    let id: Int
    let taxiTypeName: String
    let latitude, longitude: Double
    let seatCount: Int
    let kmPrice: Double
}
