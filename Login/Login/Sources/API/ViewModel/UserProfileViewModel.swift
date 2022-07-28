//
//  UserProfileViewModel.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 27/07/2022.
//

import Foundation
import UIKit

struct FlowViewModel {
    let navigationController: UINavigationController
    var userProfileViewModel: UserProfileViewModel
    
    init(navigationController: UINavigationController, userProfileViewModel: UserProfileViewModel) {
        self.navigationController = navigationController
        self.userProfileViewModel = userProfileViewModel
    }
}

struct UserProfileViewModel {
    var email: String
    var age: String
    var gender: String
    var cpf: String
    var phone: String
    var state: String
    var city: String
    var district: String
    var street: String
    
    init() {
        email = String()
        age = String()
        gender = String()
        cpf = String()
        phone = String()
        state = String()
        city = String()
        district = String()
        street = String()
    }
}
