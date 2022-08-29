//
//  DetailViewModel.swift
//  mobileTest
//
//  Created by Sillas Santos on 28/08/22.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    func successRequest()
    func errorRequest()
}

class DetailViewModel {
    
    private let service: Service = Service()
    private weak var delegate: DetailViewModelDelegate?
    
    var offer: [Offer] = []
    var lead: [Lead] = []
    
    public func delegate(delegate: DetailViewModelDelegate){
        self.delegate = delegate
    }
    
    
    public func fetchOfferDetail(){
        
        service.getOfferFromApi { success, failure in
            if let _success = success {
                self.offer = _success.offers
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
            
        }
    }
    
    public func fetchLeadDetail(){
        
        service.getOfferFromApi { success, failure in
            if let _success = success {
                self.offer = _success.offers
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
            
        }
    }
}
