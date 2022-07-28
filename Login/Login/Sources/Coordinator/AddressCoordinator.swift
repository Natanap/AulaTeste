//
//  AddressCoordinator.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 25/07/2022.
//

import Foundation
import UIKit

class AddressCoordinator:Coordinator {
    let flowViewModel: FlowViewModel
    
    init(flowViewModel: FlowViewModel) {
        self.flowViewModel = flowViewModel
    }
    
    func start() {
        let viewController = AddressViewController()
        
        viewController.onSearchCEPTap = {cep in
            CEPViewModel.getCEP(cep: cep) { (viewModel, error) in
                if let viewModel = viewModel {
                    if viewModel.isCepValid {
                        viewController.setAddressFromSearchCEP(cepViewModel: viewModel)
                    } else {
                        viewController.showMessageCepInvalid()
                    }
                }
            }
        }
        
        self.flowViewModel.navigationController.pushViewController(viewController, animated: true)
    }

}
