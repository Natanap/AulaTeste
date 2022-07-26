//
//  Enums.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 25/07/2022.
//

import Foundation

enum Age: String, CaseIterable {
    case zero = "0..15"
    case sixteen = "16..25"
    case twentySix = "26..35"
    case thirtySix = "36..50"
    case greaterFifty = ">50"
    
    static var asArray: [Age] { return self.allCases }
    
    func asint() -> Int { return Age.asArray.firstIndex(of: self) ?? 0 }
}

enum Gender: String, CaseIterable {
    case male = "👨"
    case female = "👩"
    case undefined = "Não quero informar"
    
    static var asArray: [Gender] { return self.allCases }
    func asint() -> Int { return Gender.asArray.firstIndex(of: self) ?? 0 }
}
