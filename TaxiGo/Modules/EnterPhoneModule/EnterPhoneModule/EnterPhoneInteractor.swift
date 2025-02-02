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
                length: 10,
                name: "Türkiye",
             
                phoneFormat: #"^5\d{9}$"#
                ),
            
                .init(
                    id: 2,
                    phohoneCode: "+44",
                    length: 10,
                    name: "UK",
                 
                    phoneFormat:  #"^7\d{9}$"#
                    )
        ]
        presenter?.sendCountryAndFlagList(list: list)
    }
    
    
}
