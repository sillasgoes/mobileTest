//
//  HomeViewModel.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation

class HomeViewModel {
    
    var offer = [Offers]()
    
    init() {
        fetch()
    }

    func fetch() {
        let url = URL(string: Constants.entryPoint + Constants.typeRequest.offers.rawValue)
        
        guard let url = url else { return }
        
        URLSession.shared.request(url: url, expecting: [Offers].self
        ) { [weak self ] result in
            
            switch result {
            case .success(let offers):
                self?.offer = offers
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
    var getNumberOfRows: Int {
        return offer.count
    }
    
}
