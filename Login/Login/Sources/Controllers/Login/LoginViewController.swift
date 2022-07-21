//
//  LoginViewController.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

class LoginViewController: ViewControllerDefault {
    //MARK: - Clousures
    var onTapRegister:(() -> Void)?
    var onTapOpen:((_ email: String, _ password: String) -> Void)?
    
    //MARK: - Properts
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        
        view.onTapRegister = {[weak self] in
            guard let self = self else { return }
            
            self.onTapRegister?()
        }
        
        view.onPasswordWrong = {
            self.passwordWrong()
        }
        
        view.onTapOpen = {[weak self] email, password in
            guard let self = self else { return }
            
            self.onTapOpen?(email, password)
        }
        
        return view
    }()
    
    //MARK: - Load View
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        self.title = LocalizableStrings.loginTitle.localize()
    }
    
    private func passwordWrong() {
        let alert = UIAlertController(title: "Erro",
                                      message: "Senha fora do padrão", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
