//
//  HomeInteractor.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation

class HomeInteractor : PresenterToInteractorHomeProtocol {
    var presenter : InteractorToPresenterHomeProtocol?
    func fetchTaxiInfo() {
        let list : [TaxiType] = [
            .init(imageURL: "https://firebasestorage.googleapis.com/v0/b/feastly-f1988.appspot.com/o/images%2Fyellow.png?alt=media&token=9dbe5b11-b220-434f-8da4-bca8a16cfead", 
                  taxiTypeName: "Yellow", seatCount: 4, kmPrice: 120),
            .init(imageURL: "https://firebasestorage.googleapis.com/v0/b/feastly-f1988.appspot.com/o/images%2FblackTaxi.png?alt=media&token=36a26028-6b2e-4285-ae26-aae57ca963b1", taxiTypeName: "Black", seatCount: 8, kmPrice: 200)
        ]
        presenter?.sendTaxiTypes(list: list)
    }
}
