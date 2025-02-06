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


}

//MARK: PresenterToViewHomeProtocol
protocol PresenterToViewHomeProtocol: AnyObject,Kits{
    func updateLocation(location:(latitude:Double,longitude:Double),meters:Double)
    func locationInfo(state:Bool,text:String)
}

//MARK: PresenterToInteractorHomeProtocol
protocol PresenterToInteractorHomeProtocol{
   
}

//MARK: InteractorToPresenterHomeProtocol
protocol InteractorToPresenterHomeProtocol{
    
}

//MARK: PresenterToRouterHomeProtocol
protocol PresenterToRouterHomeProtocol {
    
}

//MARK: HomeModuleProtocol
public protocol HomeModuleProtocol {
    func createModuler() -> UIViewController
}
