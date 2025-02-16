//
//  MockEnterPhoneInteractor.swift
//  EnterPhoneModuleTests
//
//  Created by Engin Gülek on 16.02.2025.
//

import Foundation
import UIKit
@testable import EnterPhoneModule
class MockEnterPhoneInteractor : PresenterToInteractorEnterPhoneProtocol {
    var mockError : Bool = false
    var presenter : InteractorToPresenterEnterPhoneProtocol?
    func createConfirmCode(paramenter: [String : Any]) async {
        if mockError {
            presenter?.interactorError()
        }else{
            presenter?.interactorSucccess()
        }
    }
    
    
}
