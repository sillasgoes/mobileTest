//
//  LaunchViewScreen.swift
//  mobileTest
//
//  Created by Sillas Santos on 23/08/22.
//

import Foundation
import UIKit

class LauchViewScreen: UIView {
    
    // MARK: - Overrides
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
        init() {
        super.init(frame: .zero)
        setupView()
        addConstraint()
    }
    
    // MARK: - Views
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "BlueDefault")
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.font = UIFont(name: "Rubik", size: 60)
        view.text = "MobileTest"
        return view
    }()
    
    // MARK: - Private Funcs
    
    private func setupView(){
        addSubview(backView)
        backView.addSubview(nameLabel)
    }
    
    private func addConstraint(){
        NSLayoutConstraint.activate([
            backView.widthAnchor.constraint(equalTo: widthAnchor),
            backView.heightAnchor.constraint(equalTo: heightAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
}
