//
//  CutomCellViewModel.swift
//  mobileTest
//
//  Created by Sillas Santos on 26/08/22.
//

import Foundation

class CustomCellViewModel {
    
    var data: Offer
    
    init(data: Offer) {
        self.data = data
    }
    
    func setupDataForCell() -> CustomCellModel {
        let result = CustomCellModel(name: data._embedded.request.title,
                                 nameOffer: data._embedded.request._embedded.user.name,
                                 data: data._embedded.request.created_at,
                                 local: data._embedded.request._embedded.address.neighborhood)
        return result
    }
}
