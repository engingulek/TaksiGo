//
//  EnterPhoneContracts.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation


struct Contract {
    let enterPhoneTitle:String
    let countryTitle:String
    let phoneNumberTitle:String
    let phoneTextFieldPlaceholder:String
    let contiuneButtonTitke:String
    let numberList:[CountryNumber] = [  .init(
        id: 1,
        phohoneCode: "+90",
        length: 10,
        name: "Türkiye",
        
        phoneFormat: #"^5\d{9}$"#
    ), .init(
            id: 2,
            phohoneCode: "+44",
            length: 10,
            name: "UK",
            
            phoneFormat:  #"^7\d{9}$"#
        )]
}


enum EnterPhoneActionType {
    case tappedContinueButton
    case selectedCountryNumber(CountryNumber)
    case phoneNumberTextFieldChanged(String?)
}


