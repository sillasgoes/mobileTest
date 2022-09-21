//
//  HomeViewModel.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation

// MARK: - Enum

public enum typeOfRequest {
    case Offer
    case Lead
}

// MARK: - Protocol

protocol HomeViewModelDelegate: AnyObject {
    func successRequest()
    func errorRequest()
}

class HomeViewModel {
    
    var offers : [Offer] = []
    var leads : [Lead] = []
    
    var service: ServiceDelegate? = Service()
    
    init(service: ServiceDelegate = Service()) {
        self.service = service
    }
    
    // MARK: - Delegate
    
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Funcs
    
    public func fetchOffer() {
        service?.getOfferFromApi { success, error in
            
            if let _success = success {
                self.offers = _success.offers
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
        }
    }
    
    public func fetchLeads() {
        service?.getLeadsFromApi { success, error in
            
            if let _success = success {
                self.leads = _success.leads
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
        }
    }
}
