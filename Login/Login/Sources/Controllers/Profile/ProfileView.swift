//
//  ProfileView.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation
import UIKit

class ProfileView: ViewDefault {
    //MARK: - Clouseres
    var onNextTap:(() -> Void)?
    var onSaveTap:((_ age: String, _ gender: String, _ cpf: String, _ phoneNumber: String) -> Void)?
    
    //MARK: - Properts
    lazy var ageLabel = LabelDefault(title: LocalizableStrings.ageLabel.localize())
    lazy var ageTextField = TextFieldDefault(placeholder: LocalizableStrings.ageTextField.localize())
    lazy var agePickerView: ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.didTapDone = {[weak self] in
            guard let self = self else { return }
            
            let row = picker.selectedRow(inComponent: 0)
            picker.selectRow(row, inComponent: 0, animated: true)
            self.ageTextField.text = Age.allCases[row].rawValue
            self.ageTextField.resignFirstResponder()
        }
        
        picker.didTapCancel = {[weak self] in
            guard let self = self else { return }
            
            self.ageTextField.text = String()
            self.ageTextField.resignFirstResponder()
        }
        
        return picker
    }()
    
    lazy var genderLabel = LabelDefault(title: LocalizableStrings.genderLabel.localize())
    lazy var genderTextField = TextFieldDefault(placeholder: LocalizableStrings.genderTextField.localize())
    lazy var genderPickerView: ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.didTapDone = {[weak self] in
            guard let self = self else { return }
            
            let row = picker.selectedRow(inComponent: 0)
            picker.selectRow(row, inComponent: 0, animated: true)
            self.genderTextField.text = Gender.allCases[row].rawValue
            self.genderTextField.resignFirstResponder()
        }
        
        picker.didTapCancel = {[weak self] in
            guard let self = self else { return }
            
            self.genderTextField.text = String()
            self.genderTextField.resignFirstResponder()
        }
        
        return picker
    }()
    
    lazy var cpfLabel = LabelDefault(title: LocalizableStrings.cpfLabel.localize())
    lazy var cpfTextField = TextFieldDefault(placeholder: LocalizableStrings.cpfTextField.localize())
    
    lazy var telefoneLabel = LabelDefault(title: LocalizableStrings.telefoneLabel.localize())
    lazy var telefoneTextField = TextFieldDefault(placeholder: LocalizableStrings.telefoneTextField.localize())
    
    lazy var buttonSave: ButtonDefault = {
        let button = ButtonDefault(title: LocalizableStrings.saveButton.localize())
        
        button.addTarget(self, action: #selector(buttonSaveTap), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonNext = ButtonDefault(title: LocalizableStrings.nextButton.localize())
    
    override func setupVisualElements() {
        super.setupVisualElements()
        
        setupAgeElements()
        setupGenderElements()
        setupCpfElements()
        setupTelefoneElements()
        setupButtonsElements()
    }
    
    //MARK: - Actions
    @objc
    func nextTap() {
        self.onNextTap?()
    }
    
    @objc
    func buttonSaveTap() {
        self.onSaveTap?(ageTextField.text ?? String(),
                        genderTextField.text ?? String(),
                        cpfTextField.text ?? String(),
                        telefoneTextField.text ?? String())
    }
}
