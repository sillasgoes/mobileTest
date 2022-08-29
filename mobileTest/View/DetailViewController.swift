//
//  DetailViewController.swift
//  mobileTest
//
//  Created by Sillas Santos on 24/08/22.
//

import Foundation
import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var detailViewModel: DetailViewModel = DetailViewModel()
    var detailView: DetailView?
    var url: URL?
    var type: typeOfRequest?
    var color: UIColor = .black
    
    // MARK: - Overrides
    
    override func loadView() {
        detailView = DetailView()
        self.view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.delegate(delegate: self)
        detailViewModel.fetchOfferDetailOffer(url: url)
        typeOfButton(type: type ?? .Offer)
    }
    
    // MARK: - Funcs
    
    func textOfUiLabel() {
        let sizeIcon = (width: 20, height: 20)
        let yForIcon = -5
        let iconLabel = "exclamationmark.circle"
        
        guard let detailModel = detailViewModel.detail else {
            return
        }
        
        let toDo = ""
        DispatchQueue.main.async {
            self.detailView?.title.text = detailModel.title
            self.detailView?.user.attributedText = Constants.textWithIcon(imageName: "person", text: detailModel.user, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon)
            self.detailView?.neighborhood.attributedText = Constants.textWithIcon(imageName: "map", text: detailModel.neighborhood, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon)
            
            self.detailView?.city.text = detailModel.city
            self.detailView?.label1.attributedText = Constants.textWithIcon(imageName: iconLabel, text: detailModel.label1, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon, color: self.color)
            self.detailView?.label2.attributedText = Constants.textWithIcon(imageName: iconLabel, text: detailModel.label2, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon, color: self.color)
            self.detailView?.label3.attributedText = Constants.textWithIcon(imageName: iconLabel, text: detailModel.label3, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon, color: self.color)
            self.detailView?.label4.attributedText = Constants.textWithIcon(imageName: iconLabel, text: detailModel.label4, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon, color: self.color)
            self.detailView?.label5.attributedText = Constants.textWithIcon(imageName: iconLabel, text: detailModel.label5, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon, color: self.color)
            self.detailView?.label6.attributedText = Constants.textWithIcon(imageName: iconLabel, text: detailModel.label6 , width: sizeIcon.width, height: sizeIcon.height, y: yForIcon, color: self.color)
            self.detailView?.label7.attributedText = Constants.textWithIcon(imageName: iconLabel, text: detailModel.label7, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon, color: self.color)
            
            self.detailView?.value1.text = toDo
            self.detailView?.value2.text = toDo
            self.detailView?.value3.text = toDo
            self.detailView?.value4.text = toDo
            self.detailView?.value5.text = toDo
            self.detailView?.value6.text = toDo
            self.detailView?.value7.text = toDo
            
            self.detailView?.clientInfo.text = "Contato do cliente"
            self.detailView?.phone.attributedText = Constants.textWithIcon(imageName: "phone", text: detailModel.phone, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon, color: self.color)
            self.detailView?.email.attributedText = Constants.textWithIcon(imageName: "envelope", text: detailModel.email, width: sizeIcon.width, height: sizeIcon.height, y: yForIcon, color: self.color)
            self.detailView?.alert.text = "Fale com o cliente o quanto antes"
            
            let initialLocaltion = CLLocation(latitude: detailModel.latitude, longitude: detailModel.longitude)
            self.detailView?.viewMap.centerToLocation(initialLocaltion, regionRadius: 1000)
            let region = MKCoordinateRegion(
                center: initialLocaltion.coordinate,
                latitudinalMeters: 50000,
                longitudinalMeters: 60000)
            
            self.detailView?.viewMap.setCameraBoundary(
                MKMapView.CameraBoundary(coordinateRegion: region),
                animated: true)
            
            let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
            self.detailView?.viewMap.setCameraZoomRange(zoomRange, animated: true)
        }
    }
    
    func typeOfButton(type: typeOfRequest) {
        if type == .Offer {
            detailView?.setupLayoutForOffer()
        }
    }
}

// MARK: - Extension

extension DetailViewController: DetailViewModelDelegate {
    func successRequest() {
        textOfUiLabel()
    }
    
    func errorRequest() {
        print("Error request")
    }
}
