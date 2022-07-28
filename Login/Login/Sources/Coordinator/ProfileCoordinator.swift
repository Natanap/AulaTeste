//
//  ProfileCoordinator.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation
import UIKit

class ProfileCoordinator:Coordinator {
    var flowViewModel: FlowViewModel
    
    init(flowViewModel: FlowViewModel) {
        self.flowViewModel = flowViewModel
    }
    
    func start() {
        let viewController = ProfileViewController()
        
        viewController.onNextTap = {
            self.gotoNextView()
        }
        
        viewController.onSaveTap = {age, gender, cpf, phoneNumber in
            self.flowViewModel.userProfileViewModel.age = age
            self.flowViewModel.userProfileViewModel.gender = gender
            self.flowViewModel.userProfileViewModel.cpf = cpf
            self.flowViewModel.userProfileViewModel.phone = phoneNumber
            
            self.gotoNextView()
        }
        
        self.flowViewModel.navigationController.pushViewController(viewController, animated: true)
    }

    func gotoNextView() {
        let coordinator = AddressCoordinator(flowViewModel: self.flowViewModel)
        coordinator.start()
    }
}
