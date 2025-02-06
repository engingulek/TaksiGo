//
//  SubView.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import Foundation
import UIKit
import SnapKit
import CoreKit
import FactoryKit


class SubView : UIView {
    private lazy var listTaxiTypeCollectionView : UICollectionView = UICollectionView.primaryCollectionView(scroolDirection: .vertical)
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(listTaxiTypeCollectionView)
        listTaxiTypeCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        listTaxiTypeCollectionView.register(TaxiTypeCVC.self, forCellWithReuseIdentifier: TaxiTypeCVC.identifier)
        listTaxiTypeCollectionView.delegate = self
        listTaxiTypeCollectionView.dataSource = self
        listTaxiTypeCollectionView.reloadData()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SubView : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaxiTypeCVC.identifier, for: indexPath) as? TaxiTypeCVC else {return UICollectionViewCell()}
        cell.configureData()
        if indexPath.item == 1 {
            cell.configureUI()
        }
        return cell
    }
}


extension SubView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Üst, sol, alt, sağ boşluklar
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
         let horizontalPadding: CGFloat = 10
         let totalSpacing = (2 * horizontalPadding)
         let itemWidth = (frame.width - totalSpacing)
         return CGSize(width: itemWidth, height: 50)
     }
    
   
}
