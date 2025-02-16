//
//  MockHomeViewController.swift
//  HomeModuleTests
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation
import UIKit

@testable import HomeModule

class MockHomeViewController : PresenterToViewHomeProtocol {
    
    
    var invokedsetTitleContractt:Bool = false
    var invokedsetTitleContractCount:Int = 0
    var invokedsetTitleContractData = [(contract:HomeModule.TitleContract,Void)]()
    func titleContract(title: HomeModule.TitleContract) {
        
        invokedsetTitleContractt = true
        invokedsetTitleContractCount += 1
        invokedsetTitleContractData.append((contract: title, ()))
        
    }
    
    var invokedupdateLocation:Bool = false
    var invokedupdateLocationCount:Int = 0
    var invokedupdateLocationData =
    [(location:(latitude: Double, longitude: Double),meters: Double)]()
    func updateLocation(
        location: (latitude: Double, longitude: Double),
        meters: Double) {
            invokedupdateLocation = true
            invokedupdateLocationCount += 1
            invokedupdateLocationData.append((location:location , meters:meters))
            
        }
    
    var invokedlocationInfo:Bool = false
    var invokedlocationInfoCount:Int = 0
    var invokedlocationInfoData =
    [(state: Bool, text: String)]()
    func locationInfo(state: Bool, text: String) {
        invokedlocationInfo = true
        invokedlocationInfoCount += 1
        invokedlocationInfoData.append((state: state, text: text))
        
    }
    
    var invokederrorState:Bool = false
    var invokederrorStateCount:Int = 0
    var invokederrorStateData =
    [(state: Bool, errorMessage: String)]()
    func errorState(state: Bool, errorMessage: String) {
        invokederrorState = true
        invokederrorStateCount += 1
        invokederrorStateData.append((state: state, errorMessage: errorMessage))
    }
    
    var invokereloadCollectionView:Bool = false
    var invoedkreloadCollectionViewCount:Int = 0
    func reloadCollectionView() {
        invokereloadCollectionView = true
        invoedkreloadCollectionViewCount += 1
    }
    
    var invokechangeColorNavigaiton:Bool = false
    var invoedkchangeColorNavigaitonCount:Int = 0
    func changeColorNavigaiton() {
        invokechangeColorNavigaiton = true
        invoedkchangeColorNavigaitonCount += 1
    }
    
    var invokedstateBackAction:Bool = false
    var invoedkstateBackActionCount:Int = 0
    var invokedstateBackActionData  = [(state:Bool,Void)]()
    func stateBackAction(state: Bool) {
        invokedstateBackAction = true
        invoedkstateBackActionCount += 1
        invokedstateBackActionData.append((state:state,()))
    }
    
    var invokedpushViewControllerAble:Bool = false
    var invoedkpushViewControllerAblecCount:Int = 0
    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {
        invokedpushViewControllerAble = true
        invoedkpushViewControllerAblecCount += 1
    }
    
    var invokedsetBackColorAble:Bool = false
    var invokedsetBackColorAbleCount:Int = 0
    var invokedsetBackColorAbleData = [(color:String,Void)]()
    func setBackColorAble(color: String) {
        invokedsetBackColorAble = true
        invokedsetBackColorAbleCount += 1
        invokedsetBackColorAbleData.append((color:color,()))
    }
    
    var involedSetMessageLabelOnTaxiInfoView:Bool = false
    var involedSetMessageLabelOnTaxiInfoViewCount:Int = 0
    var involedSetMessageLabelOnTaxiInfoViewData = [(isHidden:Bool,text:String)]()
    func setMessageLabelOnTaxiInfoView(isHidden: Bool, text: String) {
        involedSetMessageLabelOnTaxiInfoView = true
        involedSetMessageLabelOnTaxiInfoViewCount += 1
        involedSetMessageLabelOnTaxiInfoViewData.append((isHidden: isHidden, text:text))
    }
    
    
    var involedsetTaxiInfoToMap:Bool = false
    var involedsetTaxiInfoToMapCount:Int = 0
    var involedsetTaxiInfoToMapData = [(list:[HomeModule.TaxiInfoElement],Void)]()
    func setTaxiInfoToMap(list: [HomeModule.TaxiInfoElement]) {
    
    involedsetTaxiInfoToMap = true
    involedsetTaxiInfoToMapCount += 1
    involedsetTaxiInfoToMapData.append((list: list, ()))
        
    }
    
    
    
    func createAlertMesssage(title: String, message: String, actionTitle: String) {
        
    }
    
    
    
}

