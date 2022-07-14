//
//  TextFieldDefault.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 14/07/2022.
//

import Foundation
import UIKit

class TextFieldDefault: UITextField {
    convenience init(placeholder: String) {
        self.init(placeholder: placeholder, font: UIFont.systemFont(ofSize: 14), keyboardType: .default, returnKeyType: .done)
    }
    
    init(placeholder: String, font: UIFont, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType) {
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.font = font
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = UITextField.BorderStyle.roundedRect
        self.clearButtonMode = UITextField.ViewMode.whileEditing;
    }
}
