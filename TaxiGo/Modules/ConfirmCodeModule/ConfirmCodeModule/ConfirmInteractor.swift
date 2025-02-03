//
//  ConfirmInteractor.swift
//  ConfirmCodeModule
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation

class ConfirmInteractor : PresenterToInteractorConfirmCodeProtocol {
    var presenter :InteractorToPresenterConfirmCodeProtocol?
    
    func fetchConfirmCode() {
        presenter?.sendConfirmCode(code: "21443")
    }
    
    
}
