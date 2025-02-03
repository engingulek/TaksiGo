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
    private lazy var errorLabel = LabelFactory.createLabel(ofType: .smallErrorLabel)
    private lazy var phoneTextFieldUIView = UIView()
    private lazy var phoneTextField : UITextField = UITextField()
    private lazy var menuButton = UIButton(type: .system)
    private lazy var countryNumberList : [CountryNumber] = []
    private lazy var contiuneButton = ButtonFactory.createButton(ofType: .basic(action: contiuneButtonAction))
    
    private lazy var contiuneButtonAction  : UIAction = UIAction { _ in
        self.presenter?.onTappedContiuneButton()
    }
    
    override func setupView() {
        super.setupView()
        configureView()
      
     
        menuButton.addTarget(self, action: #selector(showMenu(_:)), for: .touchUpInside)
        phoneTextField.addTarget(self, action: #selector(phoneTextFieldEditChanged(_:)), for: .editingChanged)
      
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
    
    
    @objc func phoneTextFieldEditChanged(_ textField: UITextField){
        presenter?.phoneNumberTextFieldChanged(text: textField.text)
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
            make.width.equalTo(120)
            make.top.equalTo(countryTitle.snp.bottom).offset(5)
        }
        
        menuButton.titleLabel?.font = .systemFont(ofSize: 20)
        menuButton.titleLabel?.textAlignment = .left
        
        addSubview(phoneTextFieldUIView)
        phoneTextFieldUIView.snp.makeConstraints { make in
            make.leading.equalTo(menuButton.snp.trailing).offset(20)
            make.width.equalTo(200)
            
            make.top.equalTo(menuButton.snp.top)
            make.bottom.equalTo(menuButton.snp.bottom)
        }
        
        phoneTextFieldUIView.layer.borderColor = UIColor.lightGray.cgColor
        phoneTextFieldUIView.layer.borderWidth = 1
        phoneTextFieldUIView.layer.cornerRadius = 10
        
        phoneTextFieldUIView.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            
        }

        phoneTextField.keyboardType = .numberPad
        
        addSubview(phoneTitle)
        phoneTitle.snp.makeConstraints { make in
            make.top.equalTo(countryTitle.snp.top)
            make.leading.equalTo(phoneTextFieldUIView.snp.leading)
        }
        
        
        addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneTextFieldUIView.snp.bottom).offset(5)
            make.leading.equalTo(phoneTextFieldUIView.snp.leading)
            make.trailing.equalTo(phoneTextFieldUIView.snp.trailing)
        }
        
        addSubview(contiuneButton)
        contiuneButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
            make.top.equalTo(phoneTextFieldUIView.snp.bottom).offset(40)
        }
    }
    
    func configureTitleContract(titleContract:Contract) {
        enterPhoneTitle.text = titleContract.enterPhoneTitle
        countryTitle.text = titleContract.countryTitle
        phoneTitle.text = titleContract.phoneNumberTitle
        contiuneButton.setTitle(titleContract.contiuneButtonTitke, for: .normal)
        countryNumberList = titleContract.numberList
    }

  

    func updateCountryPhone(countryPhone:CountryNumber){
        menuButton.setTitle("\(countryPhone.name)(\(countryPhone.phohoneCode))", for: .normal)
    }
    
    func setError(error:(errorState:Bool,text:String,buttonBackColor:String)) {
        errorLabel.text = error.text
        contiuneButton.backgroundColor = UIColor(hex: error.buttonBackColor)
        contiuneButton.isEnabled = !error.errorState
    }
}
