//
//  EnterPhoneView.swift
//  EnterPhoneModule
//
//  Created by Engin Gülek on 2.02.2025.
//

import Foundation
import UIKit
import SnapKit
import BaseViewKit
import FactoryKit
import CoreKit


class EnterPhoneView : BaseView<EnterPhoneViewController> {
    var presenter : ViewToPrensenterEnterPhoneProtocol?
    private lazy var enterPhoneTitle = LabelFactory.createLabel(ofType: .largeTitleLabel(true))
    private lazy var countryTitle = LabelFactory.createLabel(ofType: .smallTitleLabel)
    private lazy var phoneTitle = LabelFactory.createLabel(ofType: .smallTitleLabel)
    private lazy var menuButton = UIButton(type: .system)
    private lazy var countryNumberList : [CountryNumber] = []
    
    private lazy var countyImageView : UIImageView = UIImageView()
    
    
    override func setupView() {
        super.setupView()
        configureView()
        
        menuButton.addTarget(self, action: #selector(showMenu(_:)), for: .touchUpInside)
        
        
    }
    
    @objc func showMenu(_ sender: UIButton) {
        var menuElementList : [UIMenuElement] = []
        countryNumberList.forEach { country in
            menuElementList.append(UIAction(title: "\(country.name)(\(country.phohoneCode))", handler: { _ in
                self.presenter?.selectedCounryNumber(country: country)
            }))
        }
        let menu = UIMenu(title: "", children: menuElementList)
        
        
        sender.showsMenuAsPrimaryAction = true
        sender.menu = menu
        
        
    }
    
    
    private func configureView() {
        addSubview(enterPhoneTitle)
        enterPhoneTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
        }
        
        addSubview(countryTitle)
        countryTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(enterPhoneTitle.snp.bottom).offset(25)
        }
        
        
        addSubview(menuButton)
        menuButton.snp.makeConstraints { make in
            make.leading.equalTo(countryTitle.snp.leading)
            make.top.equalTo(countryTitle.snp.bottom).offset(5)
        }
        
        menuButton.titleLabel?.font = .systemFont(ofSize: 20)
        
      
        
        /*addSubview(phoneTitle)
        phoneTitle.snp.makeConstraints { make in
            make.top.equalTo(enterPhoneTitle.snp.bottom).offset(20)
            make.leading.equalTo(phoneTitle.snp.trailing).offset(20)
        }
        
       
        
       */
    }
    
    
    func configureTitleContract(titleContract:TitleContract) {
        enterPhoneTitle.text = titleContract.enterPhoneTitle
        menuButton.setTitle("Türkiye(+90)", for: .normal)
        countryTitle.text = titleContract.countryTitle
        phoneTitle.text = titleContract.phoneNumberTitle
       
        
    }
    
    
    func setCountryAndFlagList(list:[CountryNumber]){
        countryNumberList = list
    }
    
    func updateCountryPhone(countryPhone:CountryNumber){
        menuButton.setTitle("\(countryPhone.name)(\(countryPhone.phohoneCode))", for: .normal)
    }
    
    
    
}
