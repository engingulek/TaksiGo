//
//  EnterPhoneInteractor.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation


class EnterPhoneInteractor : PresenterToInteractorEnterPhoneProtocol {
    var presenter : InteractorToPresenterEnterPhoneProtocol?
    func fetchCountryAndFlagList() {
        let list : [CountryNumber] = [
            .init(
                id: 1,
                phohoneCode: "+90",
                name: "Türkiye",
                phoneFormat: "", flagUrl: ""),
            
                .init(
                    id: 2,
                    phohoneCode: "+49",
                    name: "Germany",
                    phoneFormat: "",flagUrl:""),
            .init(
                id: 3,
                phohoneCode: "+7",
                name: "Russia",
                phoneFormat: "", flagUrl: ""),
        ]
        presenter?.sendCountryAndFlagList(list: list)
    }
    
    
}
