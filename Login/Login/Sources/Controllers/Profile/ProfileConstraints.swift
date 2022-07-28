//
//  ProfileConstraints.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 25/07/2022.
//

import Foundation
import UIKit

extension ProfileView {
    func setupAgeElements() {
        contentView.addSubview(ageLabel)
        contentView.addSubview(ageTextField)
        
        agePickerView.dataSource = self
        agePickerView.delegate = self
        
        ageTextField.inputView = agePickerView
        ageTextField.inputAccessoryView = agePickerView.toolbar
        
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstantsConstraint.topAnchor),
            ageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsConstraint.leftAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantsConstraint.rightAnchor),

            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            ageTextField.leadingAnchor.constraint(equalTo: ageLabel.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: ageLabel.trailingAnchor),
        ])
    }
    
    func setupGenderElements() {
        contentView.addSubview(genderLabel)
        contentView.addSubview(genderTextField)
        
        genderPickerView.dataSource = self
        genderPickerView.delegate = self
        
        genderTextField.inputView = genderPickerView
        genderTextField.inputAccessoryView = genderPickerView.toolbar
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsConstraint.leftAnchor),
            genderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantsConstraint.rightAnchor),

            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 8),
            genderTextField.leadingAnchor.constraint(equalTo: genderLabel.leadingAnchor),
            genderTextField.trailingAnchor.constraint(equalTo: genderLabel.trailingAnchor),
        ])
    }
    
    func setupCpfElements() {
        contentView.addSubview(cpfLabel)
        contentView.addSubview(cpfTextField)
        cpfTextField.keyboardType = .numberPad
        cpfTextField.delegate = self
        
        NSLayoutConstraint.activate([
            cpfLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            cpfLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsConstraint.leftAnchor),
            cpfLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantsConstraint.rightAnchor),

            cpfTextField.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 8),
            cpfTextField.leadingAnchor.constraint(equalTo: cpfLabel.leadingAnchor),
            cpfTextField.trailingAnchor.constraint(equalTo: cpfLabel.trailingAnchor),
        ])
    }
    
    func setupTelefoneElements() {
        contentView.addSubview(telefoneLabel)
        contentView.addSubview(telefoneTextField)
        telefoneTextField.keyboardType = .numberPad
        telefoneTextField.delegate = self
        
        NSLayoutConstraint.activate([
            telefoneLabel.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            telefoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsConstraint.leftAnchor),
            telefoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantsConstraint.rightAnchor),

            telefoneTextField.topAnchor.constraint(equalTo: telefoneLabel.bottomAnchor, constant: 8),
            telefoneTextField.leadingAnchor.constraint(equalTo: telefoneLabel.leadingAnchor),
            telefoneTextField.trailingAnchor.constraint(equalTo: telefoneLabel.trailingAnchor),
        ])
    }
    
    func setupButtonsElements() {
        contentView.addSubview(buttonSave)
        contentView.addSubview(buttonNext)
        buttonNext.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonSave.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsConstraint.leftAnchor),
            buttonSave.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantsConstraint.rightAnchor),
            buttonSave.heightAnchor.constraint(equalToConstant: ConstantsConstraint.heightButtons),
            buttonSave.bottomAnchor.constraint(equalTo: buttonNext.topAnchor, constant: -20),
            
            buttonNext.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantsConstraint.leftAnchor),
            buttonNext.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantsConstraint.rightAnchor),
            buttonNext.heightAnchor.constraint(equalToConstant: ConstantsConstraint.heightButtons),
            buttonNext.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -120),
        ])
    }
    
    
}
