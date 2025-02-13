//
//  TaxiTypeCVC.swift
//  HomeModule
//
//  Created by Engin Gülek on 6.02.2025.
//

import UIKit
import CoreKit
import FactoryKit
import SnapKit
class TaxiTypeCVC: UICollectionViewCell {
    static  let identifier : String  = "taxiTypeCell"
    private lazy var taxiImageView:UIImageView = UIImageView()
    private lazy var taxiTypeLabel = LabelFactory.createLabel(ofType: .mediumTitleLabel(true))
    
    private lazy var seatCountLabel = LabelFactory.createLabel(ofType: .smallTitleLabel(true))
    private lazy var estimatedPriceRangeLabel = LabelFactory.createLabel(ofType: .smallTitleLabel(true))
    private lazy var personIcon = IconFactory.createIcon(ofType: .person)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        contentView.addSubview(taxiImageView)
        taxiImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(50)
        }
        
        contentView.addSubview(estimatedPriceRangeLabel)
        estimatedPriceRangeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        
        
    
        
        
        contentView.addSubview(seatCountLabel)
        seatCountLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        
        contentView.addSubview(personIcon)
        personIcon.snp.makeConstraints { make in
            make.trailing.equalTo(seatCountLabel.snp.leading).offset(-5)
            make.centerY.equalToSuperview()
        }
        
        
        
        
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
    }
    
    
    func configureData(cellType : TaxiCellInfo,estimatedPrice:Double) {
        
        let imageResource = cellType.taxiTypeName == .yellow ? UIImage(resource: .yellowTaxi) :UIImage(resource: .blackTaxi)
        taxiImageView.image = imageResource
     
        taxiTypeLabel.text = cellType.taxiTypeName.rawValue
        
        estimatedPriceRangeLabel.text = String(format: "%.2f", estimatedPrice) + "₺"

        
        seatCountLabel.text = "\(cellType.seatCount)"
    }
    
    func configureUI() {
        contentView.layer.borderColor = UIColor.black.cgColor
    }
}
