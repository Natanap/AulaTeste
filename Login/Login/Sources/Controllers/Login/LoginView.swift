//
//  LoginView.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

class LoginView: ViewDefault {
    //MARK: - Clousures
    var onTapRegister:(() -> Void)?
    var onTapOpen:((_ email: String, _ password: String) -> Void)?
    var onPasswordWrong:(() -> Void)?
    
    //MARK: - Vars
    var scrollPostionDefault: CGPoint?
    
    //MARK: - Propperts
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var emailField = LabelTextDefault(labelText: LocalizableStrings.email.localize(),
                                           placeholder: LocalizableStrings.emailPlaceHolder.localize(),
                                           font: UIFont.systemFont(ofSize: Constants.fontSize),
                                           keyboardType: .emailAddress,
                                           returnKeyType: .next)

    lazy var passwordField = LabelTextDefault(labelText: LocalizableStrings.password.localize(),
                                              placeholder: LocalizableStrings.passwordPlaceHolder.localize(),isSecureTextEntry: true)
    
    lazy var buttonOpen = ButtonDefault(title: LocalizableStrings.buttonOpen.localize())
    lazy var buttonRegister = ButtonDefault(title: LocalizableStrings.buttonRegister.localize())
    
    //MARK: - Inits
    
    override func setupVisualElements() {
        super.setupVisualElements()
        self.scrollPostionDefault = self.scrollView.contentOffset
        
        setupImageView()
        setupFieldEmail()
        setupFieldPassword()
        setupButtonOpen()
        setupButtonRegister()
    }
    
    private func setupImageView() {
        contentView.addSubview(logoImageView)
        
        let kTop: CGFloat = 12
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupFieldEmail() {
        contentView.addSubview(emailField)
        emailField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: ConstantsConstraint.topAnchor),
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
    
    private func setupButtonOpen() {
        contentView.addSubview(buttonOpen)
        buttonOpen.addTarget(self, action: #selector(buttonOpenTap), for: .touchUpInside)
        
        let kTop: CGFloat = 30
        
        NSLayoutConstraint.activate([
            buttonOpen.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: kTop),
            buttonOpen.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            buttonOpen.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
    
    private func setupButtonRegister() {
        contentView.addSubview(buttonRegister)
        
        buttonRegister.addTarget(self, action: #selector(buttonRegisterTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: buttonOpen.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            buttonRegister.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            buttonRegister.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
    
    //MARK: - Actions
    @objc
    private func buttonOpenTap() {
        if !RegExp.checkPasswordComplexity(password: self.passwordField.textField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
            print("senha nao preenche os requisitos")
            self.passwordField.textField.layer.borderColor = UIColor.red.cgColor
            onPasswordWrong?()
        } else {
            self.passwordField.textField.layer.borderColor = UIColor.black.cgColor
            
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
    private func buttonRegisterTap() {
            onTapRegister?()
    }
}
