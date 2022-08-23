//
//  MainViewController.swift
//  mobileTest
//
//  Created by Sillas Santos on 23/08/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var colorBorderButton = UIColor.white
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        setupView()
        addConstraints()
    }
    
    // MARK: - Views
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "BlueBackground")
        return view
    }()
    
    private lazy var navBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "BlueDefault")
        return view
    }()
    
    private lazy var stackViewRequest: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fillEqually
        view.spacing = 3
        view.backgroundColor = UIColor(named: "BlueDefault")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackViewButtons: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 3
        view.backgroundColor = UIColor(named: "BlueDefault")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelRequest: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Pedidos"
        view.font = UIFont(name: "Rubik", size: 30)
        view.textColor = .white
        return view
    }()
    
    private lazy var iconMenu: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "square.stack.3d.up.fill")
        return view
    }()
    
    private lazy var buttonAvailable: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 100, y: 100, width: 200, height: 60)
        view.setTitle("Disponíveis", for: .normal)
        addBottomBorderWithColor(view: view, color: colorBorderButton, width: 4)
        view.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonAccept: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 100, y: 100, width: 200, height: 60)
        view.tintColor = UIColor(named: "BlueBackground")
        view.setTitle("Aceitos", for: .normal)
        addBottomBorderWithColor(view: view, color: colorBorderButton, width: 4)
        view.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return view
    }()
    
    @objc func buttonAction(){
        print("Button Pressed")
    }
    
    func addBottomBorderWithColor(view: UIView, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: view.frame.height - 20, width: view.frame.size.width, height: width)
        view.layer.addSublayer(border)
    }
    // MARK: - Private Funcs
    private func setupView(){
        view.addSubview(backView)
        backView.addSubview(navBarView)
        navBarView.addSubview(iconMenu)
        navBarView.addSubview(labelRequest)
        navBarView.addSubview(stackViewButtons)
        stackViewButtons.addArrangedSubview(buttonAvailable)
        stackViewButtons.addArrangedSubview(buttonAccept)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            backView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            navBarView.widthAnchor.constraint(equalTo: backView.widthAnchor),
            navBarView.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.2),
            navBarView.topAnchor.constraint(equalTo: backView.topAnchor),
            
            
            iconMenu.topAnchor.constraint(equalTo: navBarView.safeAreaLayoutGuide.topAnchor, constant: 13),
            iconMenu.leadingAnchor.constraint(equalTo: navBarView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            iconMenu.widthAnchor.constraint(equalToConstant: 30),
            iconMenu.heightAnchor.constraint(equalToConstant: 30),
            
            labelRequest.topAnchor.constraint(equalTo: navBarView.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelRequest.leadingAnchor.constraint(equalTo: iconMenu.leadingAnchor, constant: 40),
            
            stackViewButtons.topAnchor.constraint(equalTo: labelRequest.bottomAnchor, constant: 20),
            stackViewButtons.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor),
            stackViewButtons.widthAnchor.constraint(equalTo: navBarView.widthAnchor, multiplier: 1),
            stackViewButtons.heightAnchor.constraint(equalTo: navBarView.heightAnchor, multiplier: 0.3)
        ])
    }
}
