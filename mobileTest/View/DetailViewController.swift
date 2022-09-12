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
    let viewMap = MKMapView()
    
    let navBar = UIView()
    let backView = UIView()
    let line = UIView()
    let viewForClientInfo = UIView()
    
    let detailTitle = UILabel()
    let user = UILabel()
    let neighborhood = UILabel()
    let city = UILabel()
    let distance = UILabel()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    let label5 = UILabel()
    let label6 = UILabel()
    let label7 = UILabel()
    let label8 = UILabel()
    
    let value1 = UILabel()
    let value2 = UILabel()
    let value3 = UILabel()
    let value4 = UILabel()
    let value5 = UILabel()
    let value6 = UILabel()
    let value7 = UILabel()
    
    let clientInfo = UILabel()
    let phone = UILabel()
    let email = UILabel()
    let info = UILabel()
    let alert = UILabel()
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let stackViewForLead = UIStackView()
    
    let callButton = UIButton()
    let whatsButton = UIButton()
    let refusedButton = UIButton()
    let acceptButton = UIButton()
    
    var detailViewModel: DetailViewModel = DetailViewModel()
    var url: URL?
    var type: typeOfRequest?
    var color: UIColor = .black
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.colorBackgroud
        detailViewModel.delegate(delegate: self)
        detailViewModel.fetchOfferDetailOffer(url: url)
        typeOfButton(type: type ?? .Offer)
        startViews()
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
            self.detailTitle.text = detailModel.title
            self.user.attributedText = Constants.textWithIcon(imageName: "person",
                                                              text: detailModel.user,
                                                              width: sizeIcon.width,
                                                              height: sizeIcon.height,
                                                              y: yForIcon)
            
            self.neighborhood.attributedText = Constants.textWithIcon(imageName: "map",
                                                                      text: detailModel.neighborhood,
                                                                      width: sizeIcon.width,
                                                                      height: sizeIcon.height,
                                                                      y: yForIcon)
            
            self.city.text = detailModel.city
            self.label1.attributedText = Constants.textWithIcon(imageName: iconLabel,
                                                                text: detailModel.label1,
                                                                width: sizeIcon.width,
                                                                height: sizeIcon.height,
                                                                y: yForIcon,
                                                                color: self.color)
            
            self.label2.attributedText = Constants.textWithIcon(imageName: iconLabel,
                                                                text: detailModel.label2,
                                                                width: sizeIcon.width,
                                                                height: sizeIcon.height,
                                                                y: yForIcon,
                                                                color: self.color)
            
            self.label3.attributedText = Constants.textWithIcon(imageName: iconLabel,
                                                                text: detailModel.label3,
                                                                width: sizeIcon.width,
                                                                height: sizeIcon.height,
                                                                y: yForIcon,
                                                                color: self.color)
            
            self.label4.attributedText = Constants.textWithIcon(imageName: iconLabel,
                                                                text: detailModel.label4,
                                                                width: sizeIcon.width,
                                                                height: sizeIcon.height,
                                                                y: yForIcon,
                                                                color: self.color)
            self.label5.attributedText = Constants.textWithIcon(imageName: iconLabel,
                                                                text: detailModel.label5,
                                                                width: sizeIcon.width,
                                                                height: sizeIcon.height,
                                                                y: yForIcon,
                                                                color: self.color)
            self.label6.attributedText = Constants.textWithIcon(imageName: iconLabel,
                                                                text: detailModel.label6,
                                                                width: sizeIcon.width,
                                                                height: sizeIcon.height,
                                                                y: yForIcon, color:
                                                                    self.color)
            self.label7.attributedText = Constants.textWithIcon(imageName: iconLabel,
                                                                text: detailModel.label7,
                                                                width: sizeIcon.width,
                                                                height: sizeIcon.height,
                                                                y: yForIcon,
                                                                color: self.color)
            self.value1.text = toDo
            self.value2.text = toDo
            self.value3.text = toDo
            self.value4.text = toDo
            self.value5.text = toDo
            self.value6.text = toDo
            self.value7.text = toDo
            self.clientInfo.text = "Contato do cliente"
            self.phone.attributedText = Constants.textWithIcon(imageName: "phone",
                                                               text: detailModel.phone,
                                                               width: sizeIcon.width,
                                                               height: sizeIcon.height,
                                                               y: yForIcon,
                                                               color: self.color)
            self.email.attributedText = Constants.textWithIcon(imageName: "envelope",
                                                               text: detailModel.email,
                                                               width: sizeIcon.width,
                                                               height: sizeIcon.height,
                                                               y: yForIcon,
                                                               color: self.color)
            self.alert.text = "Fale com o cliente o quanto antes"
            
            let initialLocaltion = CLLocation(latitude: detailModel.latitude,
                                              longitude: detailModel.longitude)
            self.viewMap.centerToLocation(initialLocaltion, regionRadius: 1000)
            let region = MKCoordinateRegion(
                center: initialLocaltion.coordinate,
                latitudinalMeters: 50000,
                longitudinalMeters: 60000)
            
            self.viewMap.setCameraBoundary(
                MKMapView.CameraBoundary(coordinateRegion: region),
                animated: true)
            
            let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
            self.viewMap.setCameraZoomRange(zoomRange, animated: true)
        }
    }
    
    func typeOfButton(type: typeOfRequest) {
        if type == .Offer {
            setupLayoutForOffer()
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

extension DetailViewController {
    
    // MARK: - Configured Views
    func startViews() {
        setupViews()
        configuredLayoutViews()
        addConstraints()
    }
    
    func setupViews() {
        let views = [ navBar, scrollView, stackView, line]
        let viewsTable = [ detailTitle,
                           user,
                           neighborhood,
                           city,
                           distance,
                           label1,
                           label2,
                           label3,
                           label4,
                           label5,
                           label6,
                           label7,
                           value1,
                           value2,
                           value3,
                           value4,
                           value5,
                           value6,
                           value7,
                           clientInfo,
                           phone,
                           email,
                           info,
                           viewMap,
                           viewForClientInfo,
                           alert,
        ]
        
        let viewsStack = [callButton, whatsButton]
        
        let viewsInfo = [clientInfo, phone, email]
        
        views.forEach { view.addSubview($0) }
        views.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        viewsTable.forEach{ scrollView.addSubview($0) }
        viewsTable.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        viewsStack.forEach{ stackView.addArrangedSubview($0) }
        viewsStack.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        viewsInfo.forEach{ viewForClientInfo.addSubview($0)}
        viewsInfo.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    func configuredLayoutViews() {
        navBar.backgroundColor = Constants.colorBackgroud
        
        scrollView.backgroundColor = .white
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1100)
        
        viewMap.backgroundColor = .cyan
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = Constants.colorDefault?.cgColor
        
        stackViewForLead.distribution = .fillEqually
        stackViewForLead.axis = .horizontal
        stackViewForLead.backgroundColor = .white
        stackViewForLead.layer.borderWidth = 1
        stackViewForLead.layer.borderColor = Constants.colorDefault?.cgColor
        
        detailTitle.textColor = .black
        detailTitle.font = Constants.fontCustomDetail(size: 20)
        
        line.backgroundColor = Constants.colorDefault
        
        viewForClientInfo.backgroundColor = .green
        
        callButton.backgroundColor = .white
        callButton.setTitle("Ligar", for: .normal)
        callButton.setImage(UIImage(systemName: "phone"), for: .normal)
        callButton.titleLabel?.font = Constants.fontCustomDetail(size: 20)
        callButton.setTitleColor(Constants.colorDefault, for: .normal)
        callButton.frame = CGRect(x: 100,
                                  y: 100,
                                  width: 200,
                                  height: 60
        )
        
        whatsButton.backgroundColor = .clear
        whatsButton.setTitle("WhatsApp", for: .normal)
        whatsButton.setImage(UIImage(systemName: "phone.circle"), for: .normal)
        whatsButton.titleLabel?.font = Constants.fontCustomDetail(size: 20)
        whatsButton.setTitleColor(Constants.colorDefault, for: .normal)
        whatsButton.frame = CGRect(x: 100,
                                   y: 100,
                                   width: 200,
                                   height: 60
        )
        
        clientInfo.font = .boldSystemFont(ofSize: 20)
        phone.font = .boldSystemFont(ofSize: 15)
        email.font = .boldSystemFont(ofSize: 15)
        
    }
    
    func addConstraints(){
        
        let distanceOfLabel: CGFloat = view.frame.height / 100 * 5
        let leadingForStack: CGFloat = view.frame.width / 100 * 6
        let distanceUp: CGFloat = view.frame.height / 100 * 3
        
        NSLayoutConstraint.activate([
            
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            navBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            //10
            scrollView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: view.frame.height / 100 * 3),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 100 * 3),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100 * 3)),
            scrollView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: view.frame.height / 100 * 3),
            
            viewMap.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            viewMap.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15),
            
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            line.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            line.topAnchor.constraint(equalTo: stackView.topAnchor, constant: view.frame.width / 100 * 2),
            line.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.width / 100 * 3)),
            line.widthAnchor.constraint(equalToConstant: view.frame.width / 100 * 0.3),
            
            detailTitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            detailTitle.topAnchor.constraint(equalTo: viewMap.bottomAnchor, constant: view.frame.height / 100 * 3),
            detailTitle.heightAnchor.constraint(equalTo: viewMap.heightAnchor),
            detailTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            user.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            user.topAnchor.constraint(equalTo: detailTitle.bottomAnchor, constant: view.frame.height / 100 * 3),
            user.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            neighborhood.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4),
            neighborhood.topAnchor.constraint(equalTo: user.bottomAnchor, constant: view.frame.height / 100 * 3),
            neighborhood.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            city.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4),
            city.topAnchor.constraint(equalTo: user.bottomAnchor, constant: view.frame.height / 100 * 3),
            city.leadingAnchor.constraint(equalTo: neighborhood.trailingAnchor, constant: 10),
            
            label1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label1.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 50),
            label1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: distanceUp),
            value1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: distanceOfLabel),
            label2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value2.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: distanceUp),
            value3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label3.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: distanceOfLabel),
            label3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value3.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value3.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: distanceUp),
            value3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label4.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: distanceOfLabel),
            label4.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value4.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value4.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: distanceUp),
            value4.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label5.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: distanceOfLabel),
            label5.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value5.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value5.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: distanceUp),
            value5.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label6.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: distanceOfLabel),
            label6.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value6.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value6.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: distanceUp),
            value6.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label7.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: distanceOfLabel),
            label7.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value7.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value7.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: distanceUp),
            value7.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            viewForClientInfo.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: view.frame.height / 100 * 6),
            viewForClientInfo.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            viewForClientInfo.heightAnchor.constraint(equalTo: viewMap.heightAnchor, multiplier: 1.2),
            
            clientInfo.topAnchor.constraint(equalTo: viewForClientInfo.topAnchor, constant: view.frame.height / 100 * 1),
            clientInfo.leadingAnchor.constraint(equalTo: viewForClientInfo.leadingAnchor, constant: view.frame.width / 100 * 1),
            
            phone.topAnchor.constraint(equalTo: clientInfo.bottomAnchor, constant: view.frame.height / 100 * 2),
            phone.leadingAnchor.constraint(equalTo: viewForClientInfo.leadingAnchor, constant: view.frame.width / 100 * 4),
            
            email.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: view.frame.height / 100 * 2),
            email.leadingAnchor.constraint(equalTo: viewForClientInfo.leadingAnchor, constant: view.frame.width / 100 * 4),
            
            alert.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            alert.topAnchor.constraint(equalTo: viewForClientInfo.bottomAnchor, constant: view.frame.width / 100 * 2),
            alert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    func setupLayoutForOffer(){
        view.addSubview(stackViewForLead)
        
        stackViewForLead.addArrangedSubview(refusedButton)
        stackViewForLead.addArrangedSubview(acceptButton)
        
        NSLayoutConstraint.activate([
            stackViewForLead.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackViewForLead.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            stackViewForLead.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let viewsStackForLead = [refusedButton, acceptButton]
        
        viewsStackForLead.forEach{ stackViewForLead.addArrangedSubview($0) }
        stackViewForLead.translatesAutoresizingMaskIntoConstraints = false
        viewsStackForLead.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        
        refusedButton.setTitle("Recusar", for: .normal)
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "xmark")
        configuration.imagePadding = 10
        configuration.background.cornerRadius = 0
        configuration.baseBackgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        refusedButton.configuration = configuration
        refusedButton.titleLabel?.font = Constants.fontCustomDetail(size: 30)
        refusedButton.setTitleColor(#colorLiteral(red: 0.2549019754,
                                                  green: 0.2745098174,
                                                  blue: 0.3019607961,
                                                  alpha: 1), for: .normal)
        refusedButton.frame = CGRect(x: 100,
                                     y: 100,
                                     width: 200,
                                     height: 60
        )
        
        acceptButton.backgroundColor = .white
        acceptButton.setTitle("Aceitar", for: .normal)
        var configButton = UIButton.Configuration.filled()
        configButton.image = UIImage(systemName: "checkmark")
        configButton.imagePadding = 10
        configButton.background.cornerRadius = 0
        configButton.baseBackgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        acceptButton.configuration = configButton
        acceptButton.titleLabel?.font = Constants.fontCustomDetail(size: 30)
        acceptButton.setTitleColor(.white, for: .normal)
        acceptButton.frame = CGRect(x: 100,
                                    y: 100,
                                    width: 200,
                                    height: 60
        )
    }
}
