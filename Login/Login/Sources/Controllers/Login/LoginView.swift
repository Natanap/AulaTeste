//
//  LoginView.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    //MARK: - Propperts
    lazy var emailField = LabelTextDefault(labelText: LocalizableStrings.email.localize(),
                                           placeholder: LocalizableStrings.emailPlaceHolder.localize(),
                                           font: UIFont.systemFont(ofSize: 14),
                                           keyboardType: .emailAddress,
                                           returnKeyType: .next)

    lazy var passwordField = LabelTextDefault(labelText: LocalizableStrings.password.localize(),
                                              placeholder: LocalizableStrings.passwordPlaceHolder.localize())
    
    lazy var buttonOpen = ButtonDefault(title: LocalizableStrings.buttonOpen.localize())
    lazy var buttonRegister = ButtonDefault(title: LocalizableStrings.buttonRegister.localize())
    
    //MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .viewBackground
        
        setupVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupVisualElements() {
        setupFieldEmail()
        setupFieldPassword()
        setupButtonOpen()
        setupButtonRegister()
    }
    
    private func setupFieldEmail() {
        self.addSubview(emailField)
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            emailField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            emailField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func setupFieldPassword() {
        self.addSubview(passwordField)
        
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            passwordField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func setupButtonOpen() {
        self.addSubview(buttonOpen)
        
        NSLayoutConstraint.activate([
            buttonOpen.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            buttonOpen.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            buttonOpen.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func setupButtonRegister() {
        self.addSubview(buttonRegister)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: buttonOpen.bottomAnchor, constant: 20),
            buttonRegister.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            buttonRegister.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
}
