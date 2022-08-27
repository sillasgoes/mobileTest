//
//  DetailView.swift
//  mobileTest
//
//  Created by Sillas Santos on 26/08/22.
//

import Foundation
import UIKit

class DetailView: UIView {
    
    let navBar = UIView()
    let viewMap = UIView()
    let backView = UIView()
    let line = UIView()
    
    let title = UILabel()
    let user = UILabel()
    let neighborhood = UILabel()
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
    
    let tableView = UITableView()
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
        let views = [ navBar, tableView, stackView, line]
        let viewsTable = [ title,
                           user,
                           neighborhood,
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
        ]
        let viewsStack = [buttonCall, whatsButton]
        
        views.forEach { addSubview($0) }
        views.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        viewsTable.forEach{ tableView.addSubview($0) }
        viewsTable.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        viewsStack.forEach{ stackView.addArrangedSubview($0) }
        viewsStack.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
       
    }
    
    func configuredLayoutViews() {
        navBar.backgroundColor = Constants.colorBackgroud
        
        tableView.backgroundColor = .white
        
        viewMap.backgroundColor = .cyan
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        
        line.backgroundColor = Constants.colorDefault
        
        buttonCall.backgroundColor = .white
        buttonCall.setTitle("Ligar", for: .normal)
        buttonCall.titleLabel?.font = UIFont(name: "Rubik", size: 20)
        buttonCall.setTitleColor(Constants.colorDefault, for: .normal)
        buttonCall.frame = CGRect(x: 100,
                                  y: 100,
                                  width: 200,
                                  height: 60
        )
        
        whatsButton.backgroundColor = .clear
        whatsButton.setTitle("WhatsApp", for: .normal)
        whatsButton.titleLabel?.font = UIFont(name: "Rubik", size: 20)
        whatsButton.setTitleColor(Constants.colorDefault, for: .normal)
        whatsButton.frame = CGRect(x: 100,
                                  y: 100,
                                  width: 200,
                                  height: 60
        )
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            
            navBar.topAnchor.constraint(equalTo: topAnchor),
            navBar.widthAnchor.constraint(equalTo: widthAnchor),
            navBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            
            
            viewMap.widthAnchor.constraint(equalTo: tableView.widthAnchor),
            viewMap.heightAnchor.constraint(equalTo: tableView.heightAnchor, multiplier: 0.15),
            
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            line.centerXAnchor.constraint(equalTo: centerXAnchor),
            line.centerYAnchor.constraint(equalTo: centerYAnchor),
            line.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
            line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            line.widthAnchor.constraint(equalToConstant: 1),
            
        ])
    }
}

