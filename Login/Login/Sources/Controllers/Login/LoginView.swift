//
//  LoginView.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

class LoginView: ViewDefault {
    //MARk: - Vars
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
//            onPasswordWrong?()
        } else {
            self.passwordField.textField.layer.borderColor = UIColor.black.cgColor
        }
    }
}
