//
//  ConfirmInteractor.swift
//  ConfirmCodeModule
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import NewtworkManagerKit
struct ConfirmCode : Decodable {
    let code:String
}

class ConfirmInteractor : PresenterToInteractorConfirmCodeProtocol {
    var presenter :InteractorToPresenterConfirmCodeProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    func fetchConfirmCode(parameter:[String:Any]) async{
        do{
            let state = try await networkManager.fetch(target: .checkCode(parameter), responseClass: Bool.self)
            presenter?.sendConfirmCode(state: state)
        }catch {
            presenter?.confirmCodeError()
            
            
        }
    }
}
