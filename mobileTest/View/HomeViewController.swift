//
//  MainViewController.swift
//  mobileTest
//
//  Created by Sillas Santos on 23/08/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        makeRequest()
    }
    
    private func makeRequest(){
        
        let link = URL(string: Constants.entryPoint + Constants.typeRequest.lead.rawValue)!
        
         URLSession.shared.dataTask(with: link) { (data, response, error) in
             
             guard let data = data, error == nil else { return }
             
                guard let response = response as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    do {
                        let result = try JSONDecoder().decode(Lead.self, from: data)
                        print("Resultado \(result)")
                    } catch {
                        print("Error \(error)")
                    }
                }
         }.resume()
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
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 3
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
    
    private lazy var avaiableIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "bag")
        view.tintColor = .white
        return view
    }()
    
    private lazy var acceptIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "checkmark")
        view.tintColor = .white
        return view
    }()
    
    private lazy var buttonAvailable: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 100,
                            y: 100,
                            width: 200,
                            height: 60
        )
        view.setTitle("Disponíveis", for: .normal)
        addBottomBorderWithColor(view: view, color: Constants.colorBorderButton, width: 4)
        view.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonAccept: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 100,
                            y: 100,
                            width: 200,
                            height: 60
        )
        view.setTitle("Aceitos", for: .normal)
        addBottomBorderWithColor(view: view, color: Constants.colorBorderButton, width: 4)
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
        view.addSubview(backView)
        backView.addSubview(navBarView)
        backView.addSubview(tableView)
        navBarView.addSubview(iconMenu)
        navBarView.addSubview(labelRequest)
        navBarView.addSubview(stackViewButtons)
        
        stackViewButtons.addArrangedSubview(buttonAvailable)
        stackViewButtons.addArrangedSubview(buttonAccept)
        stackViewButtons.addSubview(avaiableIcon)
        stackViewButtons.addSubview(acceptIcon)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            backView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
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
            
            
            avaiableIcon.widthAnchor.constraint(equalToConstant: 22),
            avaiableIcon.heightAnchor.constraint(equalToConstant: 22),
            
            acceptIcon.widthAnchor.constraint(equalToConstant: 22),
            acceptIcon.heightAnchor.constraint(equalToConstant: 22),
            
            labelRequest.topAnchor.constraint(equalTo: navBarView.safeAreaLayoutGuide.topAnchor, constant: 7),
            labelRequest.leadingAnchor.constraint(equalTo: iconMenu.leadingAnchor, constant: 40),
            
            stackViewButtons.topAnchor.constraint(equalTo: labelRequest.bottomAnchor, constant: 20),
            stackViewButtons.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor),
            stackViewButtons.widthAnchor.constraint(equalTo: navBarView.widthAnchor, multiplier: 1),
            stackViewButtons.heightAnchor.constraint(equalTo: navBarView.heightAnchor, multiplier: 0.3),
            
            avaiableIcon.topAnchor.constraint(equalTo: stackViewButtons.topAnchor, constant: 14),
            avaiableIcon.leadingAnchor.constraint(equalTo: stackViewButtons.leadingAnchor, constant: 20),
            
            acceptIcon.topAnchor.constraint(equalTo: stackViewButtons.topAnchor, constant: 14),
            acceptIcon.trailingAnchor.constraint(equalTo: stackViewButtons.trailingAnchor, constant: -130),
        ])
    }
    
    // MARK: - Funcs and @objc funcs
    
    @objc func buttonAction(){
        
    }
    
    func addBottomBorderWithColor(view: UIView, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0,
                              y: view.frame.height - 20,
                              width: view.frame.size.width,
                              height: width
        )
        view.layer.addSublayer(border)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                 for: indexPath)
        return cell
    }
}
