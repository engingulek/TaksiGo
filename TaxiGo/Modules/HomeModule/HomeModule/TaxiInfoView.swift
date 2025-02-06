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
import BaseViewKit

class TaxiInfoView : BaseView<HomeViewController> {
    
    private lazy var listTaxiTypeCollectionView : UICollectionView = UICollectionView.primaryCollectionView(scroolDirection: .vertical)
    
    private lazy var sendTaxiButton = ButtonFactory.createButton(ofType: .basic(action: sendTaxiButtonAction))
    
    private lazy var sendTaxiButtonAction  : UIAction = UIAction { _ in
    }
   
    override func setupView() {
        super.setupView()
        
        configureView()
    }
    
    private func configureView(){
        backgroundColor = .white
        
        addSubview(sendTaxiButton)
        sendTaxiButton.snp.makeConstraints { make in
          
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
   
        
        
        addSubview(listTaxiTypeCollectionView)
        listTaxiTypeCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(sendTaxiButton.snp.top).offset(-5)
        }
        
        listTaxiTypeCollectionView.register(TaxiTypeCVC.self, forCellWithReuseIdentifier: TaxiTypeCVC.identifier)
        
        
        listTaxiTypeCollectionView.delegate = controller
        listTaxiTypeCollectionView.dataSource = controller
        listTaxiTypeCollectionView.reloadData()
    }
    
    
    
    func titleData(title:String){
        sendTaxiButton.setTitle(title, for: .normal)
    }

    
}
