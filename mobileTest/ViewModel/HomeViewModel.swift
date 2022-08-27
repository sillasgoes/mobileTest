//
//  HomeViewModel.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation

public enum typeOfRequest {
    case Offer
    case Lead
}

class HomeViewModel {
    
    var offer = [Offer]()
    var apiService = ApiService()
    
    init(){
        
    }
    
    func fetch(typeOf: typeOfRequest){
        
        var url: URL?
        var teste = apiService.links?.links
        switch typeOf {
        case .Offer:
            url = URL(string: teste?.offers.href ?? "")
            requestURL(url: url, codable: Offers.self)
        case .Lead:
            url = URL(string: apiService.links?.links.leads.href ?? "")
            requestURL(url: url, codable: Leads.self)
        }
        
    }
    
    func requestURL<T: Codable>(url: URL?, codable: T.Type) {
        guard let url = url else { return }
        
        URLSession.shared.request(url: url, expecting: codable
        ) { result in
            
            switch result {
            case .success(let result):
               // self?.offer.append(contentsOf: offers.offers)
                print("Resultado da chamada: \(result)")
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    

    var getNumberOfRows: Int {
        return offer.count
    }
    
}
