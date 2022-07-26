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
    
    //MARK: - Properts
    
    lazy var profileView: ProfileView = {
        let profileView = ProfileView()
        
        profileView.onNextTap = {[weak self] in
            guard let self = self else { return }
            
            self.onNextTap?()
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
