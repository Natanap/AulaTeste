//
//  LoginViewController.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    lazy var mainView = LoginView()
    
    override func loadView() {
        self.view = mainView
    }
}
