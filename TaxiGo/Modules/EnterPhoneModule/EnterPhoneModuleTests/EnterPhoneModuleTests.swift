//
//  EnterPhoneModuleTests.swift
//  EnterPhoneModuleTests
//
//  Created by Engin Gülek on 3.02.2025.
//

import XCTest
@testable import EnterPhoneModule
import CoreKit

final class EnterPhoneModuleTests: XCTestCase {
    private var viewController : MockEnterPhoneViewController!
    private var presenter : EnterPhonePresenter!
    private var router:EnterPhoneRouter!
   
    override func setUp() {
        super.setUp()
        viewController = .init()
        router = .init()
      
        presenter = .init(
            view: viewController,
            router: router
          )
    }

    override func tearDown() {
        viewController = nil
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
    
    
    func test_viewDidLoad_changeColorNavigaiton() {
        XCTAssertFalse(viewController.invokechangeColorNavigaiton,"is not false")
        XCTAssertEqual(viewController.invoedkchangeColorNavigaitonCount, 0,"is not zero (0)")
        presenter.viewDidLoad()
        
        XCTAssertTrue(viewController.invokechangeColorNavigaiton,"is not true")
        XCTAssertEqual(viewController.invoedkchangeColorNavigaitonCount, 1,"is not one (1)")
    }
    
    func test_viewDidLoad_stateBackAction() {
        XCTAssertFalse(viewController.invokedstateBackAction,"is not false")
        XCTAssertEqual(viewController.invoedkstateBackActionCount, 0,"is not zero (0)")
        presenter.viewDidLoad()
        
        XCTAssertTrue(viewController.invokedstateBackAction,"is not true")
        XCTAssertEqual(viewController.invoedkstateBackActionCount, 1,"is not one (1)")
        XCTAssertEqual(viewController.invokedstateBackActionData.map(\.state),[false],"is not correct")
        
    }
    
    func test_viewDidLoad_setEnterPhoneTitleContract_ReturnContract(){
        XCTAssertFalse(viewController.invokedsetEnterPhoneTitleContract,"is not false")
        XCTAssertEqual(viewController.invokedsetEnterPhoneTitleContractCount, 0,"is not zero (0)")
        presenter.viewDidLoad()
        
        XCTAssertTrue(viewController.invokedsetEnterPhoneTitleContract,"is not true")
        XCTAssertEqual(viewController.invokedsetEnterPhoneTitleContractCount, 1,"is not one (1)")
        
        let expectedContract = Contract(
            enterPhoneTitle: TextTheme.enterPhoneNumber.localized,
            countryTitle: TextTheme.countryTitle.localized,
            phoneNumberTitle: TextTheme.phoneNumber.localized,
            phoneTextFieldPlaceholder: TextTheme.phoneNumber.localized,
            contiuneButtonTitke: TextTheme.countiuneButtonTitle.localized,
            numberList: []
        )
        
        XCTAssertEqual(viewController.invokedsetEnterPhoneTitleContractData.map(\.contract.enterPhoneTitle),
                       [expectedContract.enterPhoneTitle],"is not enterPhoneTitle")
        
        XCTAssertEqual(viewController.invokedsetEnterPhoneTitleContractData.map(\.contract.countryTitle),
                       [expectedContract.countryTitle],"is not countryTitle")
        
        XCTAssertEqual(viewController.invokedsetEnterPhoneTitleContractData.map(\.contract.phoneNumberTitle),
                       [expectedContract.phoneNumberTitle],"is not phoneNumberTitle")
        
        
        XCTAssertEqual(viewController.invokedsetEnterPhoneTitleContractData.map(\.contract.phoneTextFieldPlaceholder),
                       [expectedContract.phoneTextFieldPlaceholder],"is not phoneTextFieldPlaceholder")
        
        XCTAssertEqual(viewController.invokedsetEnterPhoneTitleContractData.map(\.contract.contiuneButtonTitke),
                       [expectedContract.contiuneButtonTitke],"is not contiuneButtonTitke")
        
    }
    
    
    func test_viewDidLoad_phoneNumberState() {
        XCTAssertFalse(viewController.invokePhoneNumberState)
        XCTAssertEqual(viewController.invoedPhoneNumberStateCount, 0,"is not 0")
        presenter.viewDidLoad()
        
        XCTAssertTrue(viewController.invokePhoneNumberState)
        XCTAssertEqual(viewController.invoedPhoneNumberStateCount, 1,"is not 1")
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.buttonBackColor),[ColorTheme.redAlpha05.rawValue])
        
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.text),[TextTheme.defaultEmpty.localized])
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.errorState),[true])
        
    }
    
    
    /*func test_pushViewControllerAble() {
        XCTAssertFalse(viewController.invokedpushViewControllerAble)
        XCTAssertEqual(viewController.invoedkpushViewControllerAblecCount, 0,"is not 0")
        presenter.onTappedContiuneButton()
        
        XCTAssertTrue(viewController.invokedpushViewControllerAble)
        XCTAssertEqual(viewController.invoedkpushViewControllerAblecCount, 1,"is not 1")
        
    }*/
    
    func test_phoneNumber_ReturErrorIsNotTrue() {
        XCTAssertFalse(viewController.invokePhoneNumberState)
        XCTAssertEqual(viewController.invoedPhoneNumberStateCount, 0,"is not 0")
       
        presenter.selectedCounryNumber(country:  .init(
            id: 1,
            phohoneCode: "+90",
            length: 10,
            name: "Türkiye",
         
            phoneFormat: #"^5\d{9}$"#
            ))
        
        
        presenter.phoneNumberTextFieldChanged(text: "5345658496")
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.buttonBackColor),[ColorTheme.red.rawValue])
        
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.text),[TextTheme.defaultEmpty.localized])
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.errorState),[false])
    }
    
    
    func test_phoneNumber_ReturTooLongError() {
        XCTAssertFalse(viewController.invokePhoneNumberState)
        XCTAssertEqual(viewController.invoedPhoneNumberStateCount, 0,"is not 0")
       
        presenter.selectedCounryNumber(country:  .init(
            id: 1,
            phohoneCode: "+90",
            length: 10,
            name: "Türkiye",
         
            phoneFormat: #"^5\d{9}$"#
            ))
        
        
        presenter.phoneNumberTextFieldChanged(text: "534565849654242")
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.buttonBackColor),[ColorTheme.redAlpha05.rawValue])
        
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.text),[TextTheme.numberTooLong.localized])
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.errorState),[true])
    }
    
    
    func test_phoneNumber_ReturFormatError() {
        XCTAssertFalse(viewController.invokePhoneNumberState)
        XCTAssertEqual(viewController.invoedPhoneNumberStateCount, 0,"is not 0")
       
        presenter.selectedCounryNumber(country:  .init(
            id: 1,
            phohoneCode: "+90",
            length: 10,
            name: "Türkiye",
         
            phoneFormat: #"^5\d{9}$"#
            ))
        
        
        presenter.phoneNumberTextFieldChanged(text: "4345658496")
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.buttonBackColor),[ColorTheme.redAlpha05.rawValue])
        
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.text),[TextTheme.checkNumber.localized])
        
        XCTAssertEqual(viewController.invokedPhoneNumberData.map(\.error.errorState),[true])
    }
    

}
