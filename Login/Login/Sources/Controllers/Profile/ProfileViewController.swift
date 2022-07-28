//
//  ProfileViewController.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation

class ProfileViewController: ViewControllerDefault {
    //MARK: - Clouseres
    var onNextTap:(() -> Void)?
    var onSaveTap:((_ age: String, _ gender: String, _ cpf: String, _ phoneNumber: String) -> Void)?

    
    //MARK: - Properts
    
    lazy var profileView: ProfileView = {
        let profileView = ProfileView()
        
        profileView.onNextTap = {[weak self] in
            guard let self = self else { return }
            
            self.onNextTap?()
        }
        
        profileView.onSaveTap = {[weak self] age, gender, cpf, phoneNumber in
            if let self = self {
                self.onSaveTap?(age, gender, cpf, phoneNumber)
            }
        }
        
        return profileView
    }()
    
    override func loadView() {
        self.view = profileView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = LocalizableStrings.profileTitle.localize()
    }
}
