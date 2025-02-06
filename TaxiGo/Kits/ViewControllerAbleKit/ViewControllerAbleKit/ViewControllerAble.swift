//
//  ViewControllerAble.swift
//  ViewControllerAbleKit
//
//  Created by Engin Gülek on 1.02.2025.
//

import Foundation
import UIKit

//MARK: - UIViewAble
public protocol UIViewAble {
    func setBackColorAble(color:String)
}

extension UIViewAble where Self : UIViewController  {
    public func setBackColorAble(color:String){
        view.backgroundColor = UIColor(hex:color)
    }
    
}


//MARK: - SegueAble
public protocol SegueAble {
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)
    
    
}

extension SegueAble  where Self : UIViewController{
    public func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
}


public protocol NavigationDesing {
    func changeColorNavigaiton()
    /// true:open , false:close
    func stateBackAction(state:Bool)
}

extension NavigationDesing where Self : UIViewController {
    public func changeColorNavigaiton(){
        navigationController?.navigationBar.tintColor = .black
    }
    
    public func stateBackAction(state:Bool) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = state
        navigationItem.hidesBackButton = state
        
    }
}

//TODO: This will be module
extension UIColor {
   public convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
