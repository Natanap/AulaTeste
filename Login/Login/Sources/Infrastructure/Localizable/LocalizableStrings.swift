//
//  LocalizableStrings.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

enum LocalizableStrings: String {
    // Globals
    case done
    case cancel
    
    case email
    case password
    case passwordConfirm
    case buttonOpen
    case buttonRegister
    case emailPlaceHolder
    case passwordPlaceHolder
    case passwordConfirmPlaceHolder
    
    // Tela de Profile
    case profileTitle
    case ageLabel
    case ageTextField
    case genderLabel
    case genderTextField
    case cpfLabel
    case cpfTextField
    case telefoneLabel
    case telefoneTextField
    case saveButton
    case nextButton
    
    // Tela de Address
    case addressTitle
    case cepLabel
    case cepTextField

    case loginTitle
    case registerTitle
    
    func localize() -> String {
        rawValue.localizeInCurrentBundle()
    }
}

enum LocalizableAccessibilityStrings: String {
    case email
        
    func localize() -> String {
        rawValue.localizeInCurrentBundle(true)
    }
}

extension String {
    func localizeInCurrentBundle(_ accessibility: Bool = false) -> String {
        let path: Bundle = .current
        
        return NSLocalizedString(self,
                                 tableName: accessibility ? "LocalizablloginAccessibilityLocalizable": "LoginLocalizable",
                                 bundle: path,
                                 value: String(),
                                 comment: String())
    }
}

extension Bundle {
    static var current: Bundle {
        class DummyClass {
            init() {
                
            }
        }
        
        return Bundle(for: DummyClass.self)
    }
}
