//
//  HomeInteractor.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation
import NewtworkManagerKit
class HomeInteractor : PresenterToInteractorHomeProtocol {
    var presenter : InteractorToPresenterHomeProtocol?
    private let webSocketManager :  WebSocketManagerProtocol = WebSocketManager()
    
    func fetchTaxiInfo()  {
        
     
      webSocketManager.connect(target: .taxiInfo, response: [TaxiInfoElement].self) { result in
          guard let result = result else {return}
          self.presenter?.sendTaxiTypes(list: result)
            }
          
           // presenter?.sendTaxiTypes(list: result)
       
    }
}
