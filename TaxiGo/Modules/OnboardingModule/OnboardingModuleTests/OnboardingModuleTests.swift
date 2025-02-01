//
//  OnboardingModuleTests.swift
//  OnboardingModuleTests
//
//  Created by Engin Gülek on 1.02.2025.
//

import XCTest
@testable import OnboardingModule
import CoreKit
final class OnboardingModuleTests: XCTestCase {
    private var viewController : MockOnboardingViewController!
    private var presenter : OnboardingPresenter!
    private var router:  OnboardingRouter!
    override func setUp()  {
        super.setUp()
        viewController = .init()
        router = .init()
        presenter = .init(
            view: viewController,
            router: router)
    }
    
    override func tearDown()  {
        super.tearDown()
        viewController = nil
        presenter = nil
        router = nil
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
    
    
    
    func test_viewDidLoad_setOnboardingContract_ReturnOnboardingContract() {
        XCTAssertFalse(viewController.invokedsetOnboardingContract,"is not false")
        XCTAssertEqual(viewController.invokedsetOnboardingContractCount, 0,"is not zero (0)")
        presenter.viewDidLoad()
        
        XCTAssertTrue(viewController.invokedsetOnboardingContract,"is not true")
        XCTAssertEqual(viewController.invokedsetOnboardingContractCount, 1,"is not 1")
        let expectedContract = OnboardingContract(
            imageTitle: .onboarding,
            bannerTitle: TextTheme.bannerTitle.localized,
            subbannerTitle: TextTheme.subbannerTitle.localized,
            buttonTitle: TextTheme.onboardingButtonTitle.localized)
        
        /// iimageTitle
        XCTAssertEqual(viewController.invokedsetOnboardingContractData.map(\.contract.imageTitle),
                       [expectedContract.imageTitle],"is not correct")
        /// bannerTitle
        XCTAssertEqual(viewController.invokedsetOnboardingContractData.map(\.contract.bannerTitle),
                       [expectedContract.bannerTitle],"is not correct")
        
        /// subbannerTitle
        XCTAssertEqual(viewController.invokedsetOnboardingContractData.map(\.contract.subbannerTitle),
                       [expectedContract.subbannerTitle],"is not correct")
        
        /// buttonTitle
        XCTAssertEqual(viewController.invokedsetOnboardingContractData.map(\.contract.buttonTitle),
                       [expectedContract.buttonTitle],"is not correct")

    }
    
    
    
    func test_onTappedStartButton() {
        XCTAssertFalse(viewController.invokedpushViewControllerAble,"is not false")
        XCTAssertEqual(viewController.invoedkpushViewControllerAblecCount, 0,"is not zero (0)")
        presenter.onTappedStartButton()
        
        XCTAssertTrue(viewController.invokedpushViewControllerAble,"is not false")
        XCTAssertEqual(viewController.invoedkpushViewControllerAblecCount, 1,"is not zero (0)")
    }
    
    
    
}
