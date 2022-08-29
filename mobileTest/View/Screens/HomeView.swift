//
//  HomeView.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation
import UIKit

protocol HomeViewProtocolButtonTap: AnyObject {
    func didTapButton(type: typeOfRequest)
}

class HomeView: UIView {
    
    // MARK: - Init
    weak var delegate: HomeViewProtocolButtonTap?
    
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
            self.reloadData()
        }
    }
    
    public func reloadData() {
        DispatchQueue.main.async {
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
        view.attributedText = Constants.textWithIcon(imageName: "square.stack.3d.up.fill", text: "Pedidos", width: 30, height: 30, y: -4, color: .white)
        view.font = UIFont(name: "Rubik",
                           size: 30)
        view.textColor = .white
        return view
    }()
    
    private lazy var lineViewButtonAvailable: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lineViewButtonAccept: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.colorBackgroud
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
        view.tag = 1
        view.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
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
        view.tag = 2
        view.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
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
 
    // MARK: - Private Funcs
    
    private func setupView(){
        addSubview(backView)
        
        backView.addSubview(navBarView)
        backView.addSubview(lineViewButtonAvailable)
        backView.addSubview(lineViewButtonAccept)
        backView.addSubview(tableView)
        
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
            navBarView.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.25),
            navBarView.topAnchor.constraint(equalTo: backView.topAnchor),
            
            lineViewButtonAvailable.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            lineViewButtonAvailable.heightAnchor.constraint(equalToConstant: 3),
            lineViewButtonAvailable.topAnchor.constraint(equalTo: navBarView.bottomAnchor),
            lineViewButtonAvailable.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            lineViewButtonAccept.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            lineViewButtonAccept.heightAnchor.constraint(equalToConstant: 3),
            lineViewButtonAccept.topAnchor.constraint(equalTo: navBarView.bottomAnchor),
            lineViewButtonAccept.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            labelRequest.topAnchor.constraint(equalTo: navBarView.safeAreaLayoutGuide.topAnchor, constant: 7),
            labelRequest.widthAnchor.constraint(equalTo: navBarView.widthAnchor, multiplier: 0.50),
            labelRequest.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor, constant: 20),
            
            stackViewButtons.topAnchor.constraint(equalTo: labelRequest.bottomAnchor, constant: 20),
            stackViewButtons.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor),
            stackViewButtons.widthAnchor.constraint(equalTo: navBarView.widthAnchor, multiplier: 1),
            stackViewButtons.heightAnchor.constraint(equalTo: navBarView.heightAnchor, multiplier: 0.3),
        ])
    }
    // MARK: - Funcs and @objc funcs
    
    @objc func buttonAction(sender: UIButton){
        if sender.tag == 1 {
            delegate?.didTapButton(type: .Offer)
            changeColorOfLineButton(type: .Offer)
        } else {
            delegate?.didTapButton(type: .Lead)
            changeColorOfLineButton(type: .Lead)
        }
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
    
    func changeColorOfLineButton(type: typeOfRequest) {
        if type == .Offer {
            DispatchQueue.main.async {
                self.lineViewButtonAvailable.backgroundColor = .white
                self.lineViewButtonAccept.backgroundColor = Constants.colorBackgroud
            }
        }
        if type == .Lead {
            DispatchQueue.main.async {
                self.lineViewButtonAvailable.backgroundColor = Constants.colorBackgroud
                self.lineViewButtonAccept.backgroundColor = .white
            }
        }
    }
}
