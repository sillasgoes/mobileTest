//
//  CustomTableViewCell.swift
//  mobileTest
//
//  Created by Sillas Santos on 23/08/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    var customCellModel: CustomCellModel?
    private var name = UILabel()
    private var nameOffer = UILabel()
    private var date = UILabel()
    private var local = UILabel()
    
    // MARK: - Init & Overrides
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .white
        setupViews()
        addConstraints()
       }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureBorderLayout()
    }
    
    // MARK: - Configured Views
    
    func configuredViews() {
        name.textColor = Constants.colorFontCustomCell
        name.font = UIFont(name: "Rubik",
                           size: 14)
        name.text = customCellModel?.name
        
        nameOffer.textColor = Constants.colorFontCustomCell
        nameOffer.font = Constants.fontCustomCell
        nameOffer.text = customCellModel?.nameOffer
        
        date.textColor = Constants.colorFontCustomCell
        date.font = Constants.fontCustomCell
        date.text = customCellModel?.data
        
        local.textColor = Constants.colorFontCustomCell
        local.font = Constants.fontCustomCell
        local.text = customCellModel?.local
    }
    
    // MARK: - Computed Proprieties
    
    private lazy var personIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var localIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "map")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Private Funcs & Funcs
    
    private func setupViews() {
        let views: [UIView] = [name, nameOffer, date, local]
        views.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        views.forEach{addSubview($0)}
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            name.bottomAnchor.constraint(equalTo: topAnchor, constant: 30),
            
            nameOffer.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 30),
            nameOffer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            local.topAnchor.constraint(equalTo: nameOffer.bottomAnchor, constant: 5),
            local.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 30),
            date.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    func configureBorderLayout(){
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0,
                                                                     left: 0,
                                                                     bottom: 10,
                                                                     right: 0))
    }
   
}
