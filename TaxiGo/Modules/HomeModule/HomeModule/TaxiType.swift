//
//  TaxiType.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation
import UIKit
enum TaxiType:String {
    case yellow = "Yellow"
    case black  = "Black"
}

enum SeatSize :Int {
    case yellow = 4
    case black = 8
}


enum KmPrice :Double {
    case yellow = 200.0
    case black = 300.0
}

struct TaxiInfoElement: Codable {
    let id: Int
    let taxiTypeName: String
    let latitude, longitude: Double
    let seatCount: Int
    let kmPrice: Double
}

struct TaxiCellInfo {
    let taxiTypeName:TaxiType
    let seatCount: Int
    let kmPrice: Double
}
