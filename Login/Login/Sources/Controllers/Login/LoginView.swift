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
        setupImageView()
        setupFieldEmail()
        setupFieldPassword()
        setupButtonOpen()
        setupButtonRegister()
    }
    
    private func setupImageView() {
        self.addSubview(logoImageView)
        
        let kTop: CGFloat = 60
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: kTop),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setupFieldEmail() {
        self.addSubview(emailField)
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            emailField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            emailField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
    
    private func setupFieldPassword() {
        self.addSubview(passwordField)
        
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            passwordField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            passwordField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
    
    private func setupButtonOpen() {
        self.addSubview(buttonOpen)
        let kTop: CGFloat = 30
        
        NSLayoutConstraint.activate([
            buttonOpen.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: kTop),
            buttonOpen.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            buttonOpen.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
    
    private func setupButtonRegister() {
        self.addSubview(buttonRegister)
        
        NSLayoutConstraint.activate([
            buttonRegister.topAnchor.constraint(equalTo: buttonOpen.bottomAnchor, constant: ConstantsConstraint.topAnchor),
            buttonRegister.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraint.leftAnchor),
            buttonRegister.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraint.rightAnchor),
        ])
    }
}
