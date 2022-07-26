//
//  ToolbarPickerView.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 25/07/2022.
//

import Foundation
import UIKit

class ToolbarPickerView: UIPickerView {
    //MARK: - Clouseres
    var didTapDone: (() -> Void)?
    var didTapCancel: (() -> Void)?
    
    //MARK: - Properts
    public private(set) var toolbar: UIToolbar?
    public var nameReference: String = String()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        toolbar.tintColor = .black
        toolbar.sizeToFit()
        
        let done = UIButton()
        done.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        done.setTitle(LocalizableStrings.done.localize(), for: .normal)
        done.backgroundColor = .buttonBackground
        done.layer.cornerRadius = 5.0
        done.addTarget(self, action: #selector(self.doneTapped), for: .touchUpInside)
        
        let cancel = UIButton()
        cancel.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        cancel.setTitle(LocalizableStrings.cancel.localize(), for: .normal)
        cancel.backgroundColor = .buttonBackground
        cancel.layer.cornerRadius = 5.0
        cancel.addTarget(self, action: #selector(self.cancelTapped), for: .touchUpInside)
        
        let doneButton = UIBarButtonItem(customView: done)
        let cancelButton = UIBarButtonItem(customView: cancel)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        self.toolbar = toolbar
    }
    
    //MARK: - Actions
    
    @objc
    private func doneTapped() {
        self.didTapDone?()
    }
    
    @objc
    private func cancelTapped() {
        self.didTapCancel?()
    }
}
