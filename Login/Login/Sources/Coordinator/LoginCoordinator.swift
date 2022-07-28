//
//  LoginCoordinator.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    private var flowViewModel: FlowViewModel
    
    init(flowViewModel: FlowViewModel) {
        self.flowViewModel = flowViewModel
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.onTapRegister = {
            self.gotoRegisterView()
        }
        
        viewController.onTapOpen = {email, passwd in
            self.flowViewModel.userProfileViewModel.email = email            
        }
        
        self.flowViewModel.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func gotoRegisterView() {
        let coordinator = RegisterCoordinator(flowViewModel: self.flowViewModel)
        coordinator.start()
    }
}
