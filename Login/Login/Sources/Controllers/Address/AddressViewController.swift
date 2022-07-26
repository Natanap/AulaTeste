//
//  AddressViewController.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 25/07/2022.
//

import Foundation

class AddressViewController: ViewControllerDefault {
    lazy var addressView: AddressView = {
        let addressView = AddressView()
        
        return addressView
    }()
    
    override func loadView() {
        self.view = addressView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = LocalizableStrings.addressTitle.localize()
    }
}
