//
//  LabelTextDefault.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 14/07/2022.
//

import Foundation
import UIKit


class LabelTextDefault: UIView {
    //MARK: - Properts
    
    lazy private var label = LabelDefault(title: String.empty)
    lazy private var textField = TextFieldDefault(placeholder: String.empty)
    
    init(labelText: String, placeholder: String) {
        super.init(frame: .zero)
        
        self.label.text = labelText
        self.textField.placeholder = placeholder
        
        setupVisualElements()
    }
    
    init(labelText: String, placeholder: String, font: UIFont, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType) {
        super.init(frame: .zero)

        self.label.text = labelText
        self.textField.placeholder = placeholder
        self.textField.font = font
        self.textField.keyboardType = keyboardType
        self.textField.returnKeyType = returnKeyType
        
        setupVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupVisualElements() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        self.addSubview(textField)

        let kTop: CGFloat = 8
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: ConstantsConstraint.zeroAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraint.zeroAnchor),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraint.zeroAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: kTop),
            textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantsConstraint.zeroAnchor),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantsConstraint.zeroAnchor),
            
            self.bottomAnchor.constraint(equalTo: textField.bottomAnchor)
        ])
    }
}
