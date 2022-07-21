//
//  LoginCoordinator.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.onTapRegister = {
            self.gotoRegisterView()
        }
        
        viewController.onTapOpen = {email, passwd in
            
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func gotoRegisterView() {
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
