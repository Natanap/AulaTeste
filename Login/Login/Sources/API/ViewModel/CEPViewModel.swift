//
//  CEPViewModel.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 27/07/2022.
//

import Foundation

struct CEPViewModel {
    private let model: CEPModel
    
    init(withModel model: CEPModel) {
        self.model = model
    }
    
    var uf: String {
        model.uf ?? String()
    }
    
    var cidade: String {
        model.cidade ?? String()
    }
    
    var bairro: String {
        model.bairro ?? String()
    }
    
    var logradouro: String {
        "\(model.tipoLogradouro ?? String()) \(model.logradouro ?? String())"
    }
    
    var isCepValid: Bool {
        model.resultado ?? "0" == "1" ? true : false
    }
    
    static func getCEP(cep: String, completion: @escaping((CEPViewModel?, Error?) -> Void)) {
        let provider = CEPProvider()
        provider.getAddress(withCEP: cep) {(model, error) in
            if let model = model {
                completion(CEPViewModel(withModel: model), nil)
            }
            
            completion(nil, error)
        }
    }
}
