//
//  ButtonDefault.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

class ButtonDefault: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        
        initDefault()
    }
    
    init(image: UIImage) {
        super.init(frame: .zero)
        self.setTitle(String(), for: .normal)
        self.setImage(image, for: .normal)
        
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault() {
        self.backgroundColor = .buttonBackground
        self.setTitleColor(UIColor.buttonTextColor, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = ConstantsComponents.ButtonCornerRaidus
    }
}
