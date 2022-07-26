//
//  RegisterView.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation
import UIKit

class RegisterView: ViewDefault {
    //MARK: - Clousures
    var onTapRegister:(() -> Void)?
    var onTapOpen:((_ email: String, _ password: String) -> Void)?
    var onPasswordWrong:(() -> Void)?
    
    //MARK: - Vars
    var scrollPostionDefault: CGPoint?
    
    //MARK: - Properts
    lazy var emailField = LabelTextDefault(labelText: LocalizableStrings.email.localize(),
                                           placeholder: LocalizableStrings.emailPlaceHolder.localize(),
                                           font: UIFont.systemFont(ofSize: Constants.fontSize),
                                           keyboardType: .emailAddress,
                                           returnKeyType: .next)

    lazy var passwordField = LabelTextDefault(labelText: LocalizableStrings.password.localize(),
                                              placeholder: LocalizableStrings.passwordPlaceHolder.localize(),
                                              isSecureTextEntry: true,
                                              returnKeyType: .next)
    
    lazy var passwordConfirmField = LabelTextDefault(labelText: LocalizableStrings.passwordConfirm.localize(),
                                                     placeholder: LocalizableStrings.passwordConfirmPlaceHolder.localize(),
                                                     isSecureTextEntry: true,
                                                     returnKeyType: .done)
    
    lazy var buttonOpen = ButtonDefault(title: LocalizableStrings.buttonOpen.localize())
    lazy var buttonRegister = ButtonDefault(title: LocalizableStrings.buttonRegister.localize())
    
    //MARK: - ElementsVisual
    override func setupVisualElements() {
        super.setupVisualElements()
        self.scrollPostionDefault = self.scrollView.contentOffset
        
        setupFieldEmail()
        setupFieldPassword()
        setupFieldConfirmPassword()
        setupButtonRegister()
        setupButtonOpen()
    }
    
    private func setupFieldEmail() {
        contentView.addSubview(emailField)
        emailField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstantsConstraint.topAnchor),
            emailField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            emailField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
    
    private func setupFieldPassword() {
        contentView.addSubview(passwordField)
        passwordField.textField.delegate = self
        
        
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightButton.addTarget(self, action: #selector(changePasswordVisibility(_:)), for: .touchUpInside)
        
        if let image = UIImage(systemName: "eye.fill") {
            rightButton.setImage(image, for: .normal)
        }
        
        passwordField.textField.rightViewMode = .always
        passwordField.textField.rightView = rightButton
        
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            passwordField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            passwordField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
    
    private func setupFieldConfirmPassword() {
        contentView.addSubview(passwordConfirmField)
        passwordConfirmField.textField.delegate = self
        
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightButton.addTarget(self, action: #selector(changePasswordConfirmVisibility(_:)), for: .touchUpInside)
        
        if let image = UIImage(systemName: "eye.fill") {
            rightButton.setImage(image, for: .normal)
        }
        
        passwordConfirmField.textField.rightViewMode = .always
        passwordConfirmField.textField.rightView = rightButton
        
        NSLayoutConstraint.activate([
            passwordConfirmField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            passwordConfirmField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            passwordConfirmField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
    
    private func setupButtonRegister() {
        contentView.addSubview(buttonRegister)

        let kTop: CGFloat = 30

        buttonRegister.addTarget(self, action: #selector(buttonRegisterTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: passwordConfirmField.bottomAnchor, constant: kTop),
            buttonRegister.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            buttonRegister.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }

    
    private func setupButtonOpen() {
        contentView.addSubview(buttonOpen)
        buttonOpen.addTarget(self, action: #selector(buttonOpenTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonOpen.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            buttonOpen.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            buttonOpen.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
    
    
    
    //MARK: - Actions
    @objc
    private func buttonOpenTap() {
        if !RegExp.checkPasswordComplexity(password: self.passwordField.textField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
            print("senha nao preenche os requisitos")
            self.passwordField.textField.layer.borderColor = UIColor.borderColorRed.cgColor
            onPasswordWrong?()
        } else {
            self.passwordField.textField.layer.borderColor = UIColor.borderColorBlack.cgColor
            
            guard let email = self.emailField.textField.text else { return }
            guard let password = self.passwordField.textField.text else { return }
            
            onTapOpen?(email, password)
        }
    }
    
    @objc
    private func changePasswordVisibility(_ sender: UIButton) {
        passwordField.textField.isSecureTextEntry.toggle()
        
        if passwordField.textField.isSecureTextEntry {
            if let image = UIImage(systemName: "eye.fill") {
                sender.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "eye.slash.fill") {
                sender.setImage(image, for: .normal)
            }
        }
    }
    
    @objc
    private func changePasswordConfirmVisibility(_ sender: UIButton) {
        passwordConfirmField.textField.isSecureTextEntry.toggle()
        
        if passwordConfirmField.textField.isSecureTextEntry {
            if let image = UIImage(systemName: "eye.fill") {
                sender.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "eye.slash.fill") {
                sender.setImage(image, for: .normal)
            }
        }
    }
    
    @objc
    private func buttonRegisterTap() {
            onTapRegister?()
    }
}

extension RegisterView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailField.textField {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 10), animated: true)
        } else if textField == passwordField.textField {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 70), animated: true)
        } else if textField == passwordConfirmField.textField {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 130), animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.scrollView.setContentOffset(self.scrollPostionDefault ?? CGPoint(x: 0, y: 0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField.textField {
            self.passwordField.textField.becomeFirstResponder()
        } else if textField == passwordField.textField {
            self.passwordConfirmField.textField.becomeFirstResponder()
        } else if textField == passwordConfirmField.textField {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordField.textField
        || textField == passwordConfirmField.textField {
            if !RegExp.checkPasswordComplexity(password: textField.text!,
                                               length: 6,
                                               patternsToEscape:[],
                                               caseSensitivty: true,
                                               numericDigits: true,
                                               specialCharacter: true) {
                textField.layer.borderColor = UIColor.borderColorRed.cgColor
            } else {
                textField.layer.borderColor = UIColor.borderColorBlack.cgColor
            }
        }
    }

}
