//
//  AddressView.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 25/07/2022.
//

import Foundation
import UIKit

class AddressView: ViewDefault {
    //MARK: - Clousures
    var onSearchCEPTap: ((_ cep: String) -> Void)?
    
    //MARK: - Properts
    lazy var cepLabel = LabelDefault(title: LocalizableStrings.cepLabel.localize())
    lazy var cepTextField = TextFieldDefault(placeholder: LocalizableStrings.cepTextField.localize())
    lazy var buttonCep:ButtonDefault = {
        let button = ButtonDefault(image: UIImage(systemName: "magnifyingglass") ?? UIImage())
        
        button.addTarget(self, action: #selector(getCepTap), for: .touchUpInside)
        
        return button
    }()
    
    lazy var streetLabel = LabelDefault(title: "Endereço:")
    lazy var streetTextField = TextFieldDefault(placeholder: "Informe o endereço")
    
    override func setupVisualElements() {
        super.setupVisualElements()
        setupCep()
        setupStreet()
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
    
    private func setupStreet() {
        contentView.addSubview(streetLabel)
        contentView.addSubview(streetTextField)

        NSLayoutConstraint.activate([
            streetLabel.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            streetLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsConstraint.leftAnchor),
            streetLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantsConstraint.rightAnchor),
            
            streetTextField.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: 8),
            streetTextField.leadingAnchor.constraint(equalTo: streetLabel.leadingAnchor),
            streetTextField.trailingAnchor.constraint(equalTo: streetLabel.trailingAnchor),
        ])
    }
    
    @objc
    private func getCepTap() {
        if let cep = self.cepTextField.text {
            onSearchCEPTap?(cep)
        }
    }
    
    func setAddressFromSearchCEP(cepViewModel: CEPViewModel) {
        // popular os campos da tela
        DispatchQueue.main.async {
            self.streetTextField.text = cepViewModel.logradouro
        }
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

/*
 Todos os campos do endereco
    - CEP
    - Cidade
    - Estado
    - Endereco (Logradouro)
    - Numero
    - Bairro
 
    - Botao Salvar
        - Movimentar tudo para o ViewModel
        - Chamar a tela de Home passando o viewmodel
    - Botao Pular.
        - Chamar a tela de Home passando o Viewmodel vazio.
 
 
    - Tela de home.
    - Mostrar o Email, Cidade no meio da tela.
 */
