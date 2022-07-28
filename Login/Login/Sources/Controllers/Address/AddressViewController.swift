//
//  AddressViewController.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 25/07/2022.
//

import Foundation
import UIKit

class AddressViewController: ViewControllerDefault {
    //MARK: - Clousures
    var onSearchCEPTap: ((_ cep: String) -> Void)?
    
    lazy var addressView: AddressView = {
        let addressView = AddressView()
        
        addressView.onSearchCEPTap = {[weak self] cep in
            guard let self = self else { return }
            
            self.onSearchCEPTap?(cep)            
        }
        
        return addressView
    }()
    
    override func loadView() {
        self.view = addressView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = LocalizableStrings.addressTitle.localize()
    }
    
    func setAddressFromSearchCEP(cepViewModel: CEPViewModel) {
        addressView.setAddressFromSearchCEP(cepViewModel: cepViewModel)
    }
    
    func showMessageCepInvalid() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Erro",
                                          message: "CEP não encontrado", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
