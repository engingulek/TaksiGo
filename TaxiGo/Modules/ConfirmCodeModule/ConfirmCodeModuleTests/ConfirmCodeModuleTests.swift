//
//  ConfirmCodeModuleTests.swift
//  ConfirmCodeModuleTests
//
//  Created by Engin Gülek on 3.02.2025.
//

import XCTest
import UIKit
import CoreKit
import HomeModule
import DependencyKit
@testable import ConfirmCodeModule
final class ConfirmCodeModuleTests: XCTestCase {
    private var viewController : MockConfirmViewController!
    private var interactor : MockConfirmInteractor!
    private var router:ConfirmCodeRouter!
    private var presenter : ConfirmCodePresenter!
    private let container = DependencyRegister.shared.container
    override func setUp()  {
        super.setUp()
        viewController = .init()
        interactor = .init()
        router = .init()
        presenter = .init(
            view: viewController, 
            router: router,
            interactor: interactor)
        
        interactor.presenter = presenter
        
        container.register(HomeModuleProtocol.self) { _ in
            HomeRouter()
        }
    }

    override func tearDown()  {
        viewController = nil
        interactor = nil
        router = nil
        presenter = nil
    }

    func test_viewDidLoad_setBackColorAble_ReturnPrimaryBackColor(){
        
        XCTAssertFalse(viewController.invokedsetBackColorAble,"is not false")
        XCTAssertEqual(viewController.invokedsetBackColorAbleCount, 0,"is not zero (0)")
        presenter.viewDidLoad()
        
        XCTAssertTrue(viewController.invokedsetBackColorAble,"is not true")
        XCTAssertEqual(viewController.invokedsetBackColorAbleCount, 1,"is not 1")
        
        XCTAssertEqual(viewController.invokedsetBackColorAbleData.map(\.color),
                       [ColorTheme.primaryBackColor.rawValue],"is not ColorTheme.primaryBackColor.rawValue")
    }
    
    
    
    func test_viewDidLoad_setTitleContract_RetrunTitleContract() {
        XCTAssertFalse(viewController.invokedsetTitleContractt,"is not false")
        XCTAssertEqual(viewController.invokedsetTitleContractCount, 0,"is not zero (0)")
        presenter.getPhoneNumber("+90 5345658496")
        presenter.viewDidLoad()
        
        XCTAssertTrue(viewController.invokedsetTitleContractt,"is not true")
        XCTAssertEqual(viewController.invokedsetTitleContractCount, 1,"is not zero (1)")
      
        let expectedContract = TitleContract(
            title: TextTheme.confirmTitle.localized,
            infoPhone: "\(TextTheme.entered.localized) +90 5345658496",
            confirmButtonTitle: TextTheme.confirmButton.localized)
        
        /// title
        XCTAssertEqual(viewController.invokedsetTitleContractData.map(\.contract.title),
                       [expectedContract.title],"is not title")
        /// info phone
        XCTAssertEqual(viewController.invokedsetTitleContractData.map(\.contract.infoPhone),
                       [expectedContract.infoPhone],"is not correct")
        
        /// confirmButtonTitle
        XCTAssertEqual(viewController.invokedsetTitleContractData.map(\.contract.confirmButtonTitle),
                       [expectedContract.confirmButtonTitle],"is not confirmButtonTitle")
        
    }
    
    func test_confirmCode_IfConfirmCodeWrong_ReturtError(){
        XCTAssertFalse(viewController.invokeCodeErrorState,"is not false")
        XCTAssertEqual(viewController.invoedCodeErrorStateCount,0,"is not zero (0)")
        
        interactor.codeSuccess = false

        presenter.viewDidLoad()
        
        let wrongCode = "21111"
        presenter.onTappedConfirmCode(code:wrongCode)
        presenter.toHomePagePresenter()
        /// viewDidLoad -> 1 after with onTappedConfirmCode +1 = 2
        XCTAssertEqual(viewController.invoedCodeErrorStateCount,2,"is not zero (2)")
        XCTAssertTrue(viewController.invokeCodeErrorState,"is not true")
        
        XCTAssertEqual(viewController.invokedCodeErrorStateData.map(\.error.errorState),[true,true])
        
        XCTAssertEqual(viewController.invokedCodeErrorStateData.map(\.error.text),[TextTheme.defaultEmpty.localized,TextTheme.codeError.localized])
        
        XCTAssertEqual(viewController.invokedCodeErrorStateData.map(\.error.borderColor),[ColorTheme.black.rawValue,ColorTheme.red.rawValue])
    }
    
    
    func test_createAlertMessage() {
        XCTAssertFalse(viewController.invokedCreateAlerMessage)
        XCTAssertEqual(viewController.invokedCreateAlertMessageCount, 0,"is not 0")
        
        interactor.mockError = true
        presenter.onTappedConfirmCode(code: "12345")
        presenter.toHomePagePresenter()
        XCTAssertTrue(viewController.invokedCreateAlerMessage)
        XCTAssertEqual(viewController.invokedCreateAlertMessageCount, 1,"is not 1")
        
        XCTAssertEqual(viewController.involedCreateAlertMessageData.map(\.title), [TextTheme.errorTitle.localized])
        XCTAssertEqual(viewController.involedCreateAlertMessageData.map(\.message), [TextTheme.errorMessageOne.localized])
        XCTAssertEqual(viewController.involedCreateAlertMessageData.map(\.actionTitle), [TextTheme.ok.localized])
        
        
    }
}
