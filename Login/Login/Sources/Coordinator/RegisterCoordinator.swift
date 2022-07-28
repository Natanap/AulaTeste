//
//  RegisterCoordinator.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    var flowViewModel: FlowViewModel
    
    init(flowViewModel: FlowViewModel) {
        self.flowViewModel = flowViewModel
    }
    
    
    func start() {
        let viewController = RegisterViewController()
        
        viewController.onTapRegister = {email, passwd in
            self.flowViewModel.userProfileViewModel.email = email
            self.gotoProfile()
        }
        
        self.flowViewModel.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func gotoProfile() {
        let coordinator = ProfileCoordinator(flowViewModel: self.flowViewModel)
        coordinator.start()
    }
}
