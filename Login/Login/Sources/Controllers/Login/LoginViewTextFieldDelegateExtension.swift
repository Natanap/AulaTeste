//
//  LoginViewTextFieldDelegateExtension.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 18/07/2022.
//

import Foundation
import UIKit

extension LoginView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailField.textField {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 10), animated: true)
        } else if textField == passwordField.textField {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 70), animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.scrollView.setContentOffset(self.scrollPostionDefault ?? CGPoint(x: 0, y: 0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField.textField {
            self.passwordField.textField.becomeFirstResponder()
        } else if textField == passwordField.textField {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordField.textField {
            if !RegExp.checkPasswordComplexity(password: self.passwordField.textField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
                textField.layer.borderColor = UIColor.borderColorRed.cgColor
            } else {
                textField.layer.borderColor = UIColor.borderColorBlack.cgColor
            }
        }
    }
}
