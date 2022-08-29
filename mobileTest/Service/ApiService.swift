//
//  ApiService.swift
//  mobileTest
//
//  Created by Sillas Santos on 26/08/22.
//

import Foundation

protocol ApiServiceProtocol {
    func passandoLinks(links: Link)
}

class ApiService {

    init() {
        
    }
    
    var teste: Link?
    
    func fetchLinks() {
        
        let url = URL(string: Constants.entryPoint)
        
            URLSession.shared.request(url: url, expecting: Link.self
            ) { result in
                switch result {
                case .success(let links):
                    print("Chamada feita com sucesso \(links.links)")
                case .failure(let error):
                    print("Error \(error)")
                }
            }
    }
    
    func fetchLinks2() {
        
        guard let url = URL(string: Constants.entryPoint) else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil {
                
                guard let data = data else {
                    return
                }

                do {
                    let data = try JSONDecoder().decode(Link.self, from: data)
                    self.teste = data
                    print("Deu bom resultado \(data.links)")
                }
                catch let error {
                    print("Deu ruim \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
