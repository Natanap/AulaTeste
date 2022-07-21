//
//  RegisterViewController.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation

class RegisterViewController: ViewControllerDefault {
    lazy var registerView = RegisterView()
    
    override func loadView() {
        self.view = registerView
    }
    
    override func viewDidLoad() {
        self.title = LocalizableStrings.registerTitle.localize()
    }
}
