//
//  DetailViewModel.swift
//  mobileTest
//
//  Created by Sillas Santos on 28/08/22.
//

import Foundation

// MARK: - Protocol

protocol DetailViewModelDelegate: AnyObject {
    func successRequest()
    func errorRequest()
}

class DetailViewModel {
    
    // MARK: - Properties
    
    private let service: Service = Service()
    var detail: DetailModel?
    
    var offer: [Offer] = []
    var lead: [Lead] = []

    // MARK: - Delegates
    
    private weak var delegate: DetailViewModelDelegate?
    public func delegate(delegate: DetailViewModelDelegate){
        self.delegate = delegate
    }
    
    // MARK: - Funcs
    
    public func fetchOfferDetailOffer(url: URL?){
        guard let url = url else { return }
        
        service.getDetailFromApi(url: url){ success, failure in
            if let _success = success {
                let detailAux = self.detailViewModelConverted(with: _success)
                self.detail = detailAux
                self.delegate?.successRequest()
            } else {
                self.delegate?.errorRequest()
            }
        }
    }
    
    func detailViewModelConverted(with detail: Detail) -> DetailModel{
        let detailViewModel = DetailModel(distance: detail.distance,
                                          lead_price: detail.lead_price,
                                          title: detail.title,
                                          user: detail._embedded.user.name,
                                          neighborhood: detail._embedded.address.neighborhood,
                                          city: detail._embedded.address.city,
                                          label1: searchValueIntoArrayInfo(info: detail, indice: 1).label,
                                          label2: searchValueIntoArrayInfo(info: detail, indice: 2).label,
                                          label3: searchValueIntoArrayInfo(info: detail, indice: 3).label,
                                          label4: searchValueIntoArrayInfo(info: detail, indice: 4).label,
                                          label5: searchValueIntoArrayInfo(info: detail, indice: 5).label,
                                          label6: searchValueIntoArrayInfo(info: detail, indice: 6).label,
                                          label7: searchValueIntoArrayInfo(info: detail, indice: 7).label,
                                          value1: searchValueIntoArrayInfo(info: detail, indice: 1).label,
                                          value2: searchValueIntoArrayInfo(info: detail, indice: 2).label,
                                          value3: searchValueIntoArrayInfo(info: detail, indice: 3).label,
                                          value4: searchValueIntoArrayInfo(info: detail, indice: 4).label,
                                          value5: searchValueIntoArrayInfo(info: detail, indice: 5).label,
                                          value6: searchValueIntoArrayInfo(info: detail, indice: 6).label,
                                          value7: searchValueIntoArrayInfo(info: detail, indice: 7).label,
                                          phone: detail._embedded.user._embedded.phones[0].number,
                                          email: detail._embedded.user.email,
                                          latitude: detail._embedded.address.geolocation.latitude,
                                          longitude: detail._embedded.address.geolocation.longitude
        )
        return detailViewModel
    }
    
    func searchValueIntoArrayInfo(info: Detail, indice: Int) -> Detail.EmbeddedInfo.Info {
        for value in info._embedded.info.enumerated() {
            if value.offset == indice {
                return value.element
            }
        }
        return info._embedded.info[0]
    }
}
