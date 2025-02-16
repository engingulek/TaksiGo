//
//  HomeModuleTests.swift
//  HomeModuleTests
//
//  Created by Engin Gülek on 6.02.2025.
//

import XCTest
import UIKit
import CoreKit
@testable import HomeModule

final class HomeModuleTests: XCTestCase {
    private var viewController : MockHomeViewController!
    private var interactor : MockHomeInteractor!
    private var presenter : HomePresenter!
    
    override func setUp() {
        viewController = .init()
        interactor = .init()
        
        presenter = .init(
            view: viewController,
            
            intetactor: interactor)
        interactor.presenrer = presenter
    }
    
    override func tearDown() {
        viewController = nil
        interactor = nil
        
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
        
        XCTAssertFalse(viewController.invokechangeColorNavigaiton,"is not true")
        XCTAssertEqual(viewController.invoedkchangeColorNavigaitonCount, 0,"is not one (0)")
    }
    
    func test_viewDidLoad_stateBackAction() {
        XCTAssertFalse(viewController.invokedstateBackAction,"is not false")
        XCTAssertEqual(viewController.invoedkstateBackActionCount, 0,"is not zero (0)")
        presenter.viewDidLoad()
        
        XCTAssertTrue(viewController.invokedstateBackAction,"is not true")
        XCTAssertEqual(viewController.invoedkstateBackActionCount, 1,"is not one (1)")
        XCTAssertEqual(viewController.invokedstateBackActionData.map(\.state),[true],"is not correct")
        
    }
    
    func test_viewDidLoad_returntitleContract() {
        XCTAssertFalse(viewController.invokedsetTitleContractt,"is not false")
        XCTAssertEqual(viewController.invokedsetTitleContractCount, 0,"is not zero (0)")
        presenter.viewDidLoad()
        
        XCTAssertTrue(viewController.invokedsetTitleContractt,"is not true")
        XCTAssertEqual(viewController.invokedsetTitleContractCount, 1,"is not one (1)")
        XCTAssertEqual(viewController.invokedsetTitleContractData.map(\.contract.buttonTitle),[TextTheme.sendTaxi.localized],"is not correct")
    }
    
    
    
    func test_didUpdateLocation_returnLocationInfo(){
        let expectation = XCTestExpectation(description: "Async task completed")
        
        XCTAssertFalse(viewController.invokedlocationInfo,"is not false")
        XCTAssertEqual(viewController.invokedlocationInfoCount, 0,"is not zero (0)")
        let defaultLocation = (latitude:41.07726,longitude:29.03128)
        
        
        presenter.didUpdateLocation(location: defaultLocation)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            let exteptedDefault = ["Etiler street"]
            
            XCTAssertEqual( self.viewController.invokedlocationInfoData.map(\.text),exteptedDefault,"is no correct")
            
            XCTAssertTrue(self.viewController.invokedlocationInfo,"is not true")
            XCTAssertEqual(self.viewController.invokedlocationInfoCount, 1,"is not zero (0)")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        
    }
    
    
    func test_viewDidLoad_ReturnSetMessageLabelOnTaxiInfoView(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(viewController.involedSetMessageLabelOnTaxiInfoView,"is not false")
        XCTAssertEqual(viewController.involedSetMessageLabelOnTaxiInfoViewCount, 0,"is not zero (0)")
        
        presenter.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.viewController.involedSetMessageLabelOnTaxiInfoView,"is not false")
            XCTAssertEqual(self.viewController.involedSetMessageLabelOnTaxiInfoViewCount, 1,"is not zero (1)")
            XCTAssertEqual(self.viewController.involedSetMessageLabelOnTaxiInfoViewData.map(\.text),[TextTheme.selectedLocationMessage.localized])
            XCTAssertEqual(self.viewController.involedSetMessageLabelOnTaxiInfoViewData.map(\.isHidden),[false])
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        
    }
    
    
    
    func test_mapMove_ReturnSetMessageLabelOnTaxiInfoView(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(viewController.involedSetMessageLabelOnTaxiInfoView,"is not false")
        XCTAssertEqual(viewController.involedSetMessageLabelOnTaxiInfoViewCount, 0,"is not zero (0)")
        //First open screen
        presenter.viewDidLoad()
        let defaultLocation = (latitude:41.07726,longitude:29.03128)
        
        presenter.didUpdateLocation(location: defaultLocation)
        // selected location on map
        presenter.mapMove(location: (latitude: 41.01129, longitude: 28.85932))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.viewController.involedSetMessageLabelOnTaxiInfoView,"is not false")
            XCTAssertEqual(self.viewController.involedSetMessageLabelOnTaxiInfoViewCount, 2,"is not zero (2)")
            XCTAssertEqual(self.viewController.involedSetMessageLabelOnTaxiInfoViewData.map(\.text),[TextTheme.selectedLocationMessage.localized,TextTheme.defaultEmpty.localized])
            XCTAssertEqual(self.viewController.involedSetMessageLabelOnTaxiInfoViewData.map(\.isHidden),[false,true])
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        
    }
    
    
    func text_viewDidLoad_ReturnCollectionViewReload() {
        
        let expectation = XCTestExpectation(description: "Async task completed")
        
        XCTAssertFalse(viewController.invokereloadCollectionView,"is not false")
        XCTAssertEqual(viewController.invoedkreloadCollectionViewCount, 0,"is not zero (0)")
        
        presenter.viewDidLoad()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.viewController.invokereloadCollectionView,"is not true")
            XCTAssertEqual(self.viewController.invoedkreloadCollectionViewCount, 1,"is not zero (1)")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    
    func text_viewDidLoad_insetForSectionAt() {
        
        presenter.viewDidLoad()
        
        let section = presenter.insetForSectionAt()
        XCTAssertEqual(section.top,10,"is not correct")
        XCTAssertEqual(section.left,10,"is not correct")
        XCTAssertEqual(section.right,10,"is not correct")
        XCTAssertEqual(section.bottom,10,"is not correct")
        
    }
    
    
    func test_mapMove_reloadCollectionView() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(viewController.invokereloadCollectionView,"is not false")
        XCTAssertEqual(viewController.invoedkreloadCollectionViewCount, 0,"is not zero (0)")
        
        
        let defaultLocation = (latitude:41.07726,longitude:29.03128)
        
        presenter.didUpdateLocation(location: defaultLocation)
        // selected location on map
        presenter.mapMove(location: (latitude: 41.01129, longitude: 28.85932))
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.viewController.invokereloadCollectionView,"is not false")
            XCTAssertEqual(self.viewController.invoedkreloadCollectionViewCount, 1,"is not zero (1)")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_taxiTypeView_ReturnOnlyView(){
        interactor.mockList = [
            
            .init(id: 0, taxiTypeName: "yellow", latitude: 41.03268, longitude: 28.89644, seatCount: 4, kmPrice: 30.5, free_state: true),
            .init(id: 1, taxiTypeName: "black", latitude: 41.03268, longitude: 28.89644, seatCount: 8, kmPrice: 50.5, free_state: false)
        ]
        
        presenter.viewDidLoad()
        
        let indexPath : IndexPath = [0,0]
        
        let item = presenter.cellForItem(at: indexPath)
        
        XCTAssertEqual(item.borderColor,ColorTheme.black.rawValue,"is not correct")
        XCTAssertEqual(item.borderWidth, WidthTheme.small.rawValue,"is not correct")
        XCTAssertEqual(item.borderCornerRadius, CornerRadiusTheme.medium.rawValue,"is not correct")
        
        XCTAssertEqual(item.data.taxiTypeName, TaxiType.yellow,"is not correct")
        
    }
    
    func test_closeBlackTaxiType() {
        interactor.mockList = [
            .init(id: 0, taxiTypeName: "yellow", latitude: 41.03268, longitude: 28.89644, seatCount: 4, kmPrice: 30.5, free_state: true),
            .init(id: 1, taxiTypeName: "black", latitude: 41.03268, longitude: 28.89644, seatCount: 8, kmPrice: 50.5, free_state: true)
        ]
        presenter.viewDidLoad()
        
        presenter.didSelectItem(at: [0,1])
        
        let item = presenter.cellForItem(at: [0,1])
        
        XCTAssertEqual(item.borderColor,ColorTheme.black.rawValue,"is not correct")
        XCTAssertEqual(item.borderWidth, WidthTheme.small.rawValue,"is not correct")
        XCTAssertEqual(item.borderCornerRadius, CornerRadiusTheme.medium.rawValue,"is not correct")
        
        XCTAssertEqual(item.data.taxiTypeName, TaxiType.black,"is not correct")
        
        //When black's free state is false
        
        interactor.mockList = [
            .init(id: 0, taxiTypeName: "yellow", latitude: 41.03268, longitude: 28.89644, seatCount: 4, kmPrice: 30.5, free_state: true),
            .init(id: 1, taxiTypeName: "black", latitude: 41.03268, longitude: 28.89644, seatCount: 8, kmPrice: 50.5, free_state: false)
        ]
        
        interactor.fetchTaxiInfo()
        
        let itemNew = presenter.cellForItem(at: [0,0])
        XCTAssertEqual(itemNew.data.taxiTypeName, TaxiType.yellow,"is not correct")
    }
}
