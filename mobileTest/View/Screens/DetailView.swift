//
//  DetailView.swift
//  mobileTest
//
//  Created by Sillas Santos on 26/08/22.
//

import Foundation
import UIKit
import MapKit

class DetailView: UIView {
    
    let navBar = UIView()
    let viewMap = MKMapView()
    
    let backView = UIView()
    let line = UIView()
    let viewForClientInfo = UIView()
    
    let title = UILabel()
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
    let clientInfo = UILabel()
    let phone = UILabel()
    let email = UILabel()
    let info = UILabel()
    let alert = UILabel()
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let buttonCall = UIButton()
    let whatsButton = UIButton()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = Constants.colorDefault
        setupViews()
        configuredLayoutViews()
        addConstraints()
    }
    
    func setupViews() {
        let views = [ navBar, scrollView, stackView, line]
        let viewsTable = [ title,
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
                           clientInfo,
                           phone,
                           email,
                           info,
                           viewMap,
                           viewForClientInfo,
                           alert,
        ]
        
        let viewsStack = [buttonCall, whatsButton]
        
        let viewsInfo = [clientInfo, phone, email]
        
        views.forEach { addSubview($0) }
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
        scrollView.contentSize = CGSize(width: frame.size.width, height: 1100)
        
        viewMap.backgroundColor = .cyan
        let initialLocaltion = CLLocation(latitude: -23.55579114922735, longitude: -46.43631235005929)
        viewMap.centerToLocation(initialLocaltion, regionRadius: 1000)
        let region = MKCoordinateRegion(
          center: initialLocaltion.coordinate,
          latitudinalMeters: 50000,
          longitudinalMeters: 60000)
        viewMap.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        viewMap.setCameraZoomRange(zoomRange, animated: true)
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = Constants.colorDefault?.cgColor
        
        title.textColor = .black
        title.font = Constants.fontCustomDetail(size: 20)
        title.text = "Buffet Completo - Coffe - Break"
        
        line.backgroundColor = Constants.colorDefault
        
        viewForClientInfo.backgroundColor = .green
        
        buttonCall.backgroundColor = .white
        buttonCall.setTitle("Ligar", for: .normal)
        buttonCall.setImage(UIImage(systemName: "phone"), for: .normal)
        buttonCall.titleLabel?.font = Constants.fontCustomDetail(size: 20)
        buttonCall.setTitleColor(Constants.colorDefault, for: .normal)
        buttonCall.frame = CGRect(x: 100,
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
        
        
        textOfUiLabel()
    }
    
    func addConstraints(){
        
        let distanceOfLabel: CGFloat = 60
        let leadingForStack: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            navBar.topAnchor.constraint(equalTo: topAnchor),
            navBar.widthAnchor.constraint(equalTo: widthAnchor),
            navBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            scrollView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            scrollView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            
            viewMap.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            viewMap.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.15),
            
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            line.centerXAnchor.constraint(equalTo: centerXAnchor),
            line.centerYAnchor.constraint(equalTo: centerYAnchor),
            line.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            line.widthAnchor.constraint(equalToConstant: 1),
            
            title.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            title.topAnchor.constraint(equalTo: viewMap.bottomAnchor, constant: 20),
            title.heightAnchor.constraint(equalTo: viewMap.heightAnchor),
            title.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            
            user.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            user.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
            user.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            neighborhood.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4),
            neighborhood.topAnchor.constraint(equalTo: user.bottomAnchor, constant: 20),
            neighborhood.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            city.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4),
            city.topAnchor.constraint(equalTo: user.bottomAnchor, constant: 20),
            city.leadingAnchor.constraint(equalTo: neighborhood.trailingAnchor, constant: 10),
            
            label1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label1.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 50),
            label1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: distanceOfLabel),
            label2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label3.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: distanceOfLabel),
            label3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label4.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: distanceOfLabel),
            label4.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label5.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: distanceOfLabel),
            label5.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label6.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: distanceOfLabel),
            label6.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label7.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: distanceOfLabel),
            label7.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            viewForClientInfo.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 40),
            viewForClientInfo.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            viewForClientInfo.heightAnchor.constraint(equalTo: viewMap.heightAnchor, multiplier: 1.2),
            
            clientInfo.topAnchor.constraint(equalTo: viewForClientInfo.topAnchor, constant: 10),
            clientInfo.leadingAnchor.constraint(equalTo: viewForClientInfo.leadingAnchor, constant: 20),
            
            phone.topAnchor.constraint(equalTo: clientInfo.bottomAnchor, constant: 20),
            phone.leadingAnchor.constraint(equalTo: viewForClientInfo.leadingAnchor, constant: 40),
            
            email.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 20),
            email.leadingAnchor.constraint(equalTo: viewForClientInfo.leadingAnchor, constant: 40),
            
            alert.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            alert.topAnchor.constraint(equalTo: viewForClientInfo.bottomAnchor, constant: 10),
            alert.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
        ])
    }
    
    func textOfUiLabel() {
        
        let iconLabel = "exclamationmark.circle"
        
        user.attributedText = Constants.textWithIcon(imageName: "person", text: " Buffet 2")
        neighborhood.attributedText = Constants.textWithIcon(imageName: "map", text: " Vila Leopoldina")
        
        city.text = "São Paulo"
        label1.attributedText = Constants.textWithIcon(imageName: iconLabel, text: " Qual o Tipo de Evento")
        label2.attributedText = Constants.textWithIcon(imageName: iconLabel, text: " Qual será o tipo de comida?")
        label3.attributedText = Constants.textWithIcon(imageName: iconLabel, text: " Quantos convidados são esperados")
        label4.attributedText = Constants.textWithIcon(imageName: iconLabel, text: " Você também precisa de um espaço")
        label5.attributedText = Constants.textWithIcon(imageName: iconLabel, text: " Quando será o evento (opcional)")
        label6.attributedText = Constants.textWithIcon(imageName: iconLabel, text: " Como você será contactado?" )
        label7.attributedText = Constants.textWithIcon(imageName: iconLabel, text: " Informações Adicionais")
        
        clientInfo.text = "Contato do cliente"
        phone.attributedText = Constants.textWithIcon(imageName: "phone", text: " (11) 99432-2234")
        email.attributedText = Constants.textWithIcon(imageName: "envelope", text: " emaiu@getNinjas.com.br")
        alert.text = "Fale com o cliente o quanto antes"
    }
 
}
