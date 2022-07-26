//
//  AddressCoordinator.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 25/07/2022.
//

import Foundation
import UIKit

class AddressCoordinator:Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = AddressViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }

}
