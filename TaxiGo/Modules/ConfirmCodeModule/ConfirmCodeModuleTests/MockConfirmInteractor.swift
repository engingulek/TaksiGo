//
//  MockConfirmInteractor.swift
//  ConfirmCodeModuleTests
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import UIKit
@testable import ConfirmCodeModule
class MockConfirmInteractor : PresenterToInteractorConfirmCodeProtocol {
    var mockError:Bool = false
    var codeSuccess:Bool = false
    var presenter :InteractorToPresenterConfirmCodeProtocol?
    func fetchConfirmCode(parameter: [String : Any]) async {
        if mockError {
            presenter?.confirmCodeError()
            print("dadsadsa")
        }else{
            presenter?.sendConfirmCode(state: codeSuccess)
        }
    }
}
