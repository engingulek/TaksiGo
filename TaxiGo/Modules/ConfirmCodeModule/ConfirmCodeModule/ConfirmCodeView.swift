//
//  ConfirmCodeView.swift
//  ConfirmCodeModule
//
//  Created by Engin Gülek on 3.02.2025.
//

import Foundation
import BaseViewKit
import FactoryKit
import UIKit

class ConfirmCodeView : BaseView<ConfirmCodeViewController> {
    var presenter : ViewToPrensenterConfirmCodeProtocol?
    private lazy var titleLabel = LabelFactory.createLabel(ofType: .mediumTitleLabel(true))
    private lazy var infoPhoneLabel = LabelFactory.createLabel(ofType: .mediumTitleLabel(false))
    private lazy var errorLabel = LabelFactory.createLabel(ofType: .mediumErrorLabel(true))
    
    private lazy var textFields: [UITextField] = []
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var confirmButton = ButtonFactory.createButton(ofType: .basic(action: cofirmButtonAction))
    
    private lazy var cofirmButtonAction  : UIAction = UIAction { _ in
        let code = self.textFields.compactMap { $0.text }.filter { !$0.isEmpty }.joined()
        self.presenter?.onTappedConfirmCode(code: code)
    }
    
    override func setupView() {
        super.setupView()
        configureView()
    }
    
    private func configureView() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        addSubview(infoPhoneLabel)
        infoPhoneLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(infoPhoneLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        for i in 0..<5 {
            let textField = createOTPTextField()
            textField.tag = i
            stackView.addArrangedSubview(textField)
            textFields.append(textField)
        }
        
        addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
        }
    }
    
    private func createOTPTextField() -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        textField.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
        return textField
    }
}

extension ConfirmCodeView {
    func setTitleContract(_ contract:TitleContract) {
        titleLabel.text = contract.title
        infoPhoneLabel.text = contract.infoPhone
        confirmButton.setTitle(contract.confirmButtonTitle, for: .normal)
    }
    
    func setCodeErrorState(error: (errorState: Bool, text: String, borderColor: String)) {
        errorLabel.isHidden = !error.errorState
        errorLabel.text = error.text
        textFields.forEach { textField in
            textField.layer.borderColor = UIColor(hex: error.borderColor)?.cgColor
        }
    }
}

extension ConfirmCodeView : UITextFieldDelegate {
    @objc private func textDidChange(_ textField: UITextField) {
        
        if let text = textField.text,text.count == 1 {
            let nextTag = textField.tag + 1
            if nextTag < textFields.count {
                textFields[nextTag].becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        } else if textField.text?.isEmpty == true {
            let previousTag = textField.tag - 1
            if previousTag >= 0 {
                textFields[previousTag].becomeFirstResponder()
            }
        }
    }
    
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let newLength = currentText.count + string.count - range.length
        return newLength <= 1
    }
}
