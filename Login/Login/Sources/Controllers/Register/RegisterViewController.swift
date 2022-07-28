//
//  RegisterViewController.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation

class RegisterViewController: ViewControllerDefault {
    var onTapRegister:((_ email: String, _ password: String) -> Void)?
    
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        
        view.onTapRegister = {[weak self] email, password in
            if let self = self {
                self.onTapRegister?(email, password)
            }
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = registerView
    }
    
    override func viewDidLoad() {
        self.title = LocalizableStrings.registerTitle.localize()
    }
}
