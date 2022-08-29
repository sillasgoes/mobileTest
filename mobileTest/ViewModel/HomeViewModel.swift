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

protocol HomeViewModeDelegate: AnyObject{
    func successRequest()
    func errorRequest()
}

class HomeViewModel {
    
    var offers : [Offer] = []
    var leads : [Lead] = []
   
    private let service: Service = Service()
    
    private weak var delegate: HomeViewModeDelegate?
    
    public func delegate(delegate: HomeViewModeDelegate){
        self.delegate = delegate
    }
    
    public func fetchAllRequest(){
        service.getOfferFromApi { success, error in
            
            if let _success = success {
                self.offers = _success.offers
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
                
        }
    }

    func fetchO(completion: @escaping (Offers) -> () ) {
        
        let url = URL(string: Constants.entryPoint)
        var urlRequest: URL?
        
        URLSession.shared.request(url: url, expecting: Link.self
        ) { result in
            
            switch result {
            case .success(let links):
                
                urlRequest = URL(string: links.links.offers.href)
                self.requestURL(url: urlRequest, codable: Offers.self) { result in
                    completion(result)
                }
                
            case .failure(let error):
                print("Error \(error)")
            }
        }
        
    }
    
    func fetchL(completion: @escaping (Leads) -> () ) {
        
        let url = URL(string: Constants.entryPoint)
        var urlRequest: URL?
        
        URLSession.shared.request(url: url, expecting: Link.self
        ) { result in
            
            switch result {
            case .success(let links):
                
                urlRequest = URL(string: links.links.offers.href)
                self.requestURL(url: urlRequest, codable: Leads.self) { result in
                    completion(result)
                }
                
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
    func requestURL<T: Codable>(url: URL?, codable: T.Type, completion: @escaping (T) -> () ) {
        guard let url = url else { return }
        
        URLSession.shared.request(url: url, expecting: codable
        ) { result in
            
            switch result {
            case .success(let result):
                completion(result)
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
}
