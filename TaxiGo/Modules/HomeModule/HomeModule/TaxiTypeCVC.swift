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
    private lazy var taxiImage:UIImageView = UIImageView()
    private lazy var taxiType = LabelFactory.createLabel(ofType: .mediumTitleLabel(true))
    private lazy var arrivalMinuteLabel = LabelFactory.createLabel(ofType: .smallTitleLabel(false))
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
        contentView.addSubview(taxiImage)
        taxiImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        taxiImage.setImageWithKigfisher(
            with: "https://firebasestorage.googleapis.com/v0/b/feastly-f1988.appspot.com/o/images%2Fyellow.png?alt=media&token=9dbe5b11-b220-434f-8da4-bca8a16cfead",
            size: 50
        )
        contentView.addSubview(estimatedPriceRangeLabel)
        estimatedPriceRangeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        
        estimatedPriceRangeLabel.text = "₺150-300"
        
        contentView.addSubview(arrivalMinuteLabel)
        arrivalMinuteLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        arrivalMinuteLabel.text = "2dk"
        
        contentView.addSubview(seatCountLabel)
        seatCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(arrivalMinuteLabel.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
        }
        
        seatCountLabel.text = "4"
        contentView.addSubview(personIcon)
        personIcon.snp.makeConstraints { make in
            make.trailing.equalTo(seatCountLabel.snp.leading).offset(-5)
            make.centerY.equalToSuperview()
        }
        
        
      
        
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
        /*addSubview(taxiType)
        taxiType.snp.makeConstraints { make in
            
        }*/
    }
    
    
    func configureData() {
        taxiType.text = "Yellow"
    }
    
    func configureUI() {
        contentView.layer.borderColor = UIColor.black.cgColor
    }
}
