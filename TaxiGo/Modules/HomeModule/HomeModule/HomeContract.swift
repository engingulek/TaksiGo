//
//  HomeContract.swift
//  HomeModule
//
//  Created by Engin Gülek on 4.02.2025.
//

import Foundation

enum MapUIViewAbles {
    case setLocationInfo(Bool,String)
    case updateLocation((Double,Double),Double)
    case errorState(Bool,String)
 
}

struct TitleContract {
    let buttonTitle:String
}
