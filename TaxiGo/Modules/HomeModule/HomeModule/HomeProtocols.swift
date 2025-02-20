//
//  HomeProtocols.swift
//  HomeModule
//
//  Created by Engin Gülek on 4.02.2025.
//

import Foundation
import UIKit
import ViewControllerAbleKit

typealias Kits = UIViewAble & SegueAble  & NavigationDesing & AlertMessageAble

struct CellType<T> {
    let data:T
    let borderColor:String
    let borderWidth:CGFloat
    let borderCornerRadius:CGFloat
}

//MARK: ViewToPrensenterHomeProtocol
protocol ViewToPrensenterHomeProtocol{
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    func mapMove(location:(latitude:Double,longitude:Double))
    
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath) -> CellType<TaxiCellInfo>
    func sizeForItemAt(width:CGFloat,height:CGFloat) -> CGSize
    func insetForSectionAt() ->(top:CGFloat,left:CGFloat,right:CGFloat,bottom:CGFloat)
    func didSelectItem(at indexPath:IndexPath)
    
    func onTappedSendTaxi()
    
    func distanceKm(price:Double) -> Double
    func toUserLocation()
    
}

//MARK: PresenterToViewHomeProtocol
protocol PresenterToViewHomeProtocol: AnyObject,Kits{
    func titleContract(title:TitleContract)
    func updateLocation(location:(latitude:Double,longitude:Double),meters:Double)
    func locationInfo(state:Bool,text:String)
    
    func reloadCollectionView()
    func setTaxiInfoToMap(list:[TaxiInfoElement])
   func setMessageLabelOnTaxiInfoView(isHidden:Bool,text:String)
}

//MARK: PresenterToInteractorHomeProtocol
protocol PresenterToInteractorHomeProtocol{
    func fetchTaxiInfo() 
}

//MARK: InteractorToPresenterHomeProtocol
protocol InteractorToPresenterHomeProtocol{
    func sendTaxiTypes(list:[TaxiInfoElement])
}

//MARK: PresenterToRouterHomeProtocol
protocol PresenterToRouterHomeProtocol {
    
}

//MARK: HomeModuleProtocol
public protocol HomeModuleProtocol {
    func createModuler() -> UIViewController
}
