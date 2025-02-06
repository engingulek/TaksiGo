//
//  HomeProtocols.swift
//  HomeModule
//
//  Created by Engin Gülek on 4.02.2025.
//

import Foundation
import UIKit
import ViewControllerAbleKit

typealias Kits = UIViewAble & SegueAble  & NavigationDesing


//MARK: ViewToPrensenterHomeProtocol
protocol ViewToPrensenterHomeProtocol{
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    func mapMove(location:(latitude:Double,longitude:Double))
    
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath) -> TaxiType
    func sizeForItemAt(width:CGFloat,height:CGFloat) -> CGSize
    func insetForSectionAt() ->(top:CGFloat,left:CGFloat,right:CGFloat,bottom:CGFloat)
    
    
}

//MARK: PresenterToViewHomeProtocol
protocol PresenterToViewHomeProtocol: AnyObject,Kits{
    func titleContract(title:TitleContract)
    func updateLocation(location:(latitude:Double,longitude:Double),meters:Double)
    func locationInfo(state:Bool,text:String)
    func errorState(state:Bool,errorMessage:String)
}

//MARK: PresenterToInteractorHomeProtocol
protocol PresenterToInteractorHomeProtocol{
    func fetchTaxiInfo()
}

//MARK: InteractorToPresenterHomeProtocol
protocol InteractorToPresenterHomeProtocol{
    func sendTaxiTypes(list:[TaxiType])
}

//MARK: PresenterToRouterHomeProtocol
protocol PresenterToRouterHomeProtocol {
    
}

//MARK: HomeModuleProtocol
public protocol HomeModuleProtocol {
    func createModuler() -> UIViewController
}
