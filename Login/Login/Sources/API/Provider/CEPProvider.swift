//
//  CEPProvider.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 27/07/2022.
//

import Foundation

class CEPProvider {
    func getAddress(withCEP cep: String, completion: @escaping((CEPModel?, Error?) -> Void)) {
        let urlString = "https://webservice.kinghost.net/web_cep.php?auth=73b65d791603439f96cab4e7af82e7d0&formato=json&cep=\(cep.replacingOccurrences(of: "-", with: ""))"
        
        guard let url = URL(string: urlString) else { return }
        
        let urlRequest = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            if let error = error {
                debugPrint(error)
                completion(nil, error)
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                guard let model = try? decoder.decode(CEPModel.self, from: data)
                else {
                    completion(nil, error)
                    
                    return
                }
                
                print(model)
                
                completion(model, nil)
            }            
        }
        
        task.resume()
    }
}
