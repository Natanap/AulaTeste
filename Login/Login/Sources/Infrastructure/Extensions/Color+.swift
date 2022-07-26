//
//  Color+.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 13/07/2022.
//

import Foundation
import UIKit

extension UIColor {
    static var buttonBackground: UIColor {
        return UIColor(named: "buttonBackground") ?? .red
    }

    static var buttonTextColor: UIColor {
        return UIColor(named: "buttonTextColor") ?? .red
    }

    static var labelTextColor: UIColor {
        return UIColor(named: "labelTextColor") ?? .red
    }

    static var viewBackground: UIColor {
        return UIColor(named: "viewBackground") ?? .red
    }
    
    static var borderColorRed: UIColor {
        return UIColor.red
    }
    
    static var borderColorBlack: UIColor {
        return UIColor.black
    }
}
