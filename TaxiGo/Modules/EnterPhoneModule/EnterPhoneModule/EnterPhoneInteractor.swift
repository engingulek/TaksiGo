//
//  EnterPhoneInteractor.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 12.02.2025.
//

import Foundation
import NewtworkManagerKit
class EnterPhoneInteractor : PresenterToInteractorEnterPhoneProtocol {
    var presenter : InteractorToPresenterEnterPhoneProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    func createConfirmCode(paramenter: [String:Any]) async {
        do{
            let _ = try await networkManager.fetch(target: .createConfirmCode(paramenter), responseClass:Int.self)
        }catch{
            presenter?.interactorError()
            
        }
    }
    
    
}
