//
//  UICollectionView+Extension.swift
//  CoreKit
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation
import UIKit
extension UICollectionView {
    public static func primaryCollectionView(tag:Int = 0,scroolDirection:UICollectionView.ScrollDirection) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
       layout.scrollDirection = scroolDirection
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.tag = tag
         
        return collectionView
    }
}
