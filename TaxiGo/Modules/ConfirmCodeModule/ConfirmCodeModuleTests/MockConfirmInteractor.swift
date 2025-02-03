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
    var mockCode:String = ""
    var presenter :InteractorToPresenterConfirmCodeProtocol?
    func fetchConfirmCode() {
        presenter?.sendConfirmCode(code: mockCode)
    }
    
    
}
