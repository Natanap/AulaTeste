//
//  String+.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 14/07/2022.
//

import Foundation

extension String {
    static let empty = String()
    
    var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
}
