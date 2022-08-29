//
//  HomeView.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
   public func setupTableViewDelegates(delegate: UITableViewDelegate, datasource: UITableViewDataSource){
       DispatchQueue.main.async {
           self.tableView.delegate = delegate
           self.tableView.dataSource = datasource
           self.tableView.reloadData()
       }
    }
    
    // MARK: - Proprieties Computed
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.colorBackgroud
        return view
    }()
    
    lazy var navBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.colorDefault
        return view
    }()
    
    private lazy var stackViewButtons: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .bottom
        view.distribution = .fillEqually
        view.backgroundColor = Constants.colorDefault
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelRequest: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Pedidos"
        view.font = UIFont(name: "Rubik",
                           size: 30)
        view.textColor = .white
        return view
    }()
    
    private lazy var iconMenu: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "square.stack.3d.up.fill")
        view.tintColor = .white
        return view
    }()

    private lazy var buttonAvailable: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Disponíveis"
        configuration.image = UIImage(systemName: "bag")
        configuration.imagePadding = 10
        configuration.background.cornerRadius = 0
        view.configuration = configuration
        view.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonAccept: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Aceitos", for: .normal)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Aceitos"
        configuration.image = UIImage(systemName: "checkmark")
        configuration.imagePadding = 10
        configuration.background.cornerRadius = 0
        view.configuration = configuration
        view.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        view.backgroundColor = backView.backgroundColor
        view.separatorStyle = .none
        view.rowHeight = 100
        return view
    }()
    
    lazy var testView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Private Funcs
    
    private func setupView(){
        addSubview(backView)
        backView.addSubview(navBarView)
        backView.addSubview(tableView)
        navBarView.addSubview(iconMenu)
        navBarView.addSubview(labelRequest)
        navBarView.addSubview(stackViewButtons)
        
        stackViewButtons.addArrangedSubview(buttonAvailable)
        stackViewButtons.addArrangedSubview(buttonAccept)
      
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            backView.widthAnchor.constraint(equalTo: widthAnchor),
            backView.heightAnchor.constraint(equalTo: heightAnchor),
            
            navBarView.widthAnchor.constraint(equalTo: backView.widthAnchor),
            navBarView.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.2),
            navBarView.topAnchor.constraint(equalTo: backView.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            iconMenu.topAnchor.constraint(equalTo: navBarView.safeAreaLayoutGuide.topAnchor, constant: 13),
            iconMenu.leadingAnchor.constraint(equalTo: navBarView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            iconMenu.widthAnchor.constraint(equalToConstant: 30),
            iconMenu.heightAnchor.constraint(equalToConstant: 30),
           
            labelRequest.topAnchor.constraint(equalTo: navBarView.safeAreaLayoutGuide.topAnchor, constant: 7),
            labelRequest.leadingAnchor.constraint(equalTo: iconMenu.leadingAnchor, constant: 40),
            
            stackViewButtons.topAnchor.constraint(equalTo: labelRequest.bottomAnchor, constant: 20),
            stackViewButtons.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor),
            stackViewButtons.widthAnchor.constraint(equalTo: navBarView.widthAnchor, multiplier: 1),
            stackViewButtons.heightAnchor.constraint(equalTo: navBarView.heightAnchor, multiplier: 0.3),

        ])
    }
    // MARK: - Funcs and @objc funcs
    
    @objc func buttonAction(){
        
    }
    
    func addBottomBorderWithColor(view: UIView, color: UIColor, width: CGFloat) {
        let border = UIView(frame: frame)
        border.backgroundColor = UIColor.white
        border.frame = CGRect(x: 0,
                              y: view.frame.size.height,
                              width: view.frame.size.width,
                              height: width
        )
        view.addSubview(border)
    }
}
