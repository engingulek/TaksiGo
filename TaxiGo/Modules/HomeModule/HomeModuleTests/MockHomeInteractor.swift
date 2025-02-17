//
//  MockHomeInteractor.swift
//  HomeModuleTests
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation

@testable import HomeModule

class MockHomeInteractor : PresenterToInteractorHomeProtocol {
    
    var mockList: [TaxiInfoElement] = []
    var presenrer : InteractorToPresenterHomeProtocol?
    
    func fetchTaxiInfo() {
        presenrer?.sendTaxiTypes(list: mockList)
    }
    
    
}
