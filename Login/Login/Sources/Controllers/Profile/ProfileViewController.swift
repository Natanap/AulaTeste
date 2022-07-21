//
//  ProfileViewController.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation

class ProfileViewController: ViewControllerDefault {
    //MARK: - Properts
    
    lazy var profileView = ProfileView()
    
    override func loadView() {
        self.view = profileView
    }
}
