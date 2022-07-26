//
//  ProfileCoordinator.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation
import UIKit

class ProfileCoordinator:Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ProfileViewController()
        
        viewController.onNextTap = {
            self.gotoNextView()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }

    func gotoNextView() {
        let coordinator = AddressCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
