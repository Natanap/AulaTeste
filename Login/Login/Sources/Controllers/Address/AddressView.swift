//
//  AddressView.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 25/07/2022.
//

import Foundation
import UIKit

class AddressView: ViewDefault {
    //MARK: - Properts
    lazy var cepLabel = LabelDefault(title: LocalizableStrings.cepLabel.localize())
    lazy var cepTextField = TextFieldDefault(placeholder: LocalizableStrings.cepTextField.localize())
    lazy var buttonCep = ButtonDefault(image: UIImage(systemName: "magnifyingglass") ?? UIImage())
    
    override func setupVisualElements() {
        super.setupVisualElements()
        setupCep()
    }
    
    func setupCep() {
        contentView.addSubview(cepLabel)
        contentView.addSubview(cepTextField)
        contentView.addSubview(buttonCep)
        
        buttonCep.layer.cornerRadius = 15
        
        cepTextField.delegate = self
        
        NSLayoutConstraint.activate([
            cepLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstantsConstraint.topAnchor),
            cepLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsConstraint.leftAnchor),
            cepLabel.widthAnchor.constraint(equalToConstant: 110),

            buttonCep.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantsConstraint.rightAnchor),
            
            buttonCep.widthAnchor.constraint(equalToConstant: 30),
            buttonCep.heightAnchor.constraint(equalToConstant: 30),
            
            buttonCep.centerYAnchor.constraint(equalTo: cepTextField.centerYAnchor),
            
            cepTextField.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 8),
            cepTextField.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor),
            cepTextField.trailingAnchor.constraint(equalTo: buttonCep.leadingAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
}

extension AddressView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == cepTextField {
            textField.text = String(textField.text!.prefix(9))
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == cepTextField {
            if !string.isBackspace {
                if range.location == 5 {
                    textField.text = textField.text! + "-"
                }
            }
        }
        
        return true
    }
}
