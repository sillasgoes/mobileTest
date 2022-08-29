//
//  CutomCellViewModel.swift
//  mobileTest
//
//  Created by Sillas Santos on 26/08/22.
//

import Foundation

class CustomCellViewModel {
    
    func setupDataForCell(data: Offer) -> CustomCellModel {
        
        let result = CustomCellModel(name: data._embedded.request.title,
                                     nameOffer: data._embedded.request._embedded.user.name,
                                     date: data._embedded.request.created_at,
                                     local: data._embedded.request._embedded.address.neighborhood,
                                     city: data._embedded.request._embedded.address.city,
                                     state: data.state,
                                     link: data._links.self_.href)
        return result
    }
    
    func setupDataForCell(data: Lead) -> CustomCellModel {
        
        let result = CustomCellModel(name: data._embedded.request.title,
                                     nameOffer: data._embedded.user.name,
                                     date: data.created_at,
                                     local: data._embedded.address.neighborhood,
                                     city: data._embedded.address.city,
                                     state: "",
                                     link: data._links.self_.href)
        return result
    }
}
