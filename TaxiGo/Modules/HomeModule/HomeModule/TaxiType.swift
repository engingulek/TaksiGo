//
//  TaxiType.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation

enum TaxiType:String {
    case yellow = "https://firebasestorage.googleapis.com/v0/b/feastly-f1988.appspot.com/o/images%2Fyellow.png?alt=media&token=9dbe5b11-b220-434f-8da4-bca8a16cfead"
    case black = "https://firebasestorage.googleapis.com/v0/b/feastly-f1988.appspot.com/o/images%2FblackTaxi.png?alt=media&token=6b2b754d-f163-4381-8a0f-340025e6f7a2"
}

struct TaxiInfoElement: Codable {
    let id: Int
    let taxiTypeName: String
    let latitude, longitude: Double
    let seatCount: Int
    let kmPrice: Double
}
