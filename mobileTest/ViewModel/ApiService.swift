//
//  ApiService.swift
//  mobileTest
//
//  Created by Sillas Santos on 26/08/22.
//

import Foundation

class ApiService {
    
    var links: Link?
    
    init() {
      fetchLinks()
    }
    
    func fetchLinks() {
        let url = URL(string: Constants.entryPoint)
        
        guard let url = url else { return }
        
        URLSession.shared.request(url: url, expecting: Link.self
        ) { result in
            switch result {
            case .success(let links):
                self.links = links
                print("Chamada feita com sucesso \(links.links)")
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
}
