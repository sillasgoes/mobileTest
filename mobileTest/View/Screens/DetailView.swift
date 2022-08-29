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
    
    var detailModel: DetailModel?
    
    let viewMap = MKMapView()
    
    let navBar = UIView()
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
    
    let detailViewModel = DetailViewModel()
    
    // MARK: - Init & Overrides
    
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
    
    // MARK: - Funcs
    
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
        
        title.textColor = .black
        title.font = Constants.fontCustomDetail(size: 20)
        
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
            
            value1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
            value1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: distanceOfLabel),
            label2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value2.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            value3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label3.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: distanceOfLabel),
            label3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value3.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value3.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 10),
            value3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label4.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: distanceOfLabel),
            label4.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value4.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value4.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 10),
            value4.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label5.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: distanceOfLabel),
            label5.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value5.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value5.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: 10),
            value5.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label6.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label6.topAnchor.constraint(equalTo: label5.bottomAnchor, constant: distanceOfLabel),
            label6.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value6.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value6.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: 10),
            value6.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            label7.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            label7.topAnchor.constraint(equalTo: label6.bottomAnchor, constant: distanceOfLabel),
            label7.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
            value7.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            value7.topAnchor.constraint(equalTo: label7.bottomAnchor, constant: 10),
            value7.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: leadingForStack),
            
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
    
    func setupLayoutForOffer(){
        addSubview(stackViewForLead)
        
        stackViewForLead.addArrangedSubview(refusedButton)
        stackViewForLead.addArrangedSubview(acceptButton)
        
        NSLayoutConstraint.activate([
            stackViewForLead.widthAnchor.constraint(equalTo: widthAnchor),
            stackViewForLead.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            stackViewForLead.bottomAnchor.constraint(equalTo: bottomAnchor),
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
        refusedButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
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
