//
//  CustomTableViewCell.swift
//  mobileTest
//
//  Created by Sillas Santos on 23/08/22.
//

import UIKit

// MARK: - Protocol

protocol CustomTableViewCellProtocol: AnyObject {
    func didTapButton(link: String)
}

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CustomTableViewCell"
    
    var customCellModel: CustomCellModel?
    
    weak var delegate: CustomTableViewCellProtocol?
    
    private var name = UILabel()
    private var nameOffer = UILabel()
    private var date = UILabel()
    private var local = UILabel()
    private var city = UILabel()
    private var button = UIButton()
    
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
    
    // MARK: - Funcs and @objc funcs
    
    func configuredViews() {
        let color = setRead(state: customCellModel?.state ?? "")
        
        name.textColor = Constants.colorFontCustomCell
        name.font = UIFont(name: "Rubik",
                           size: 14)
        name.text = customCellModel?.name
        
        nameOffer.textColor = Constants.colorFontCustomCell
        nameOffer.font = Constants.fontCustomCell
        nameOffer.text = customCellModel?.nameOffer
        nameOffer.attributedText = Constants.textWithIcon(imageName: "person.fill",
                                                          text: customCellModel?.nameOffer ?? "",
                                                          width: 13,
                                                          height: 13,
                                                          y: -2,
                                                          color: color)
        
        date.textColor = Constants.colorFontCustomCell
        date.font = Constants.fontCustomCell
        date.attributedText = Constants.textWithIcon(imageName: "person.fill",
                                                     text: convertDate(with: customCellModel?.date ?? ""),
                                                     width: 13,
                                                     height: 13,
                                                     y: -2,
                                                     color: color)
        
        local.textColor = Constants.colorFontCustomCell
        local.font = Constants.fontCustomCell
        local.attributedText = Constants.textWithIcon(imageName: "map.fill",
                                                      text: customCellModel?.local ?? "",
                                                      width: 13,
                                                      height: 13,
                                                      y: -2,
                                                      color: color)
        
        city.textColor = Constants.colorFontCustomCell
        city.font = Constants.fontCustomCell
        city.text = customCellModel?.city
        
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonFunction), for: .touchUpInside)
    }
    
    @objc func buttonFunction(){
        delegate?.didTapButton(link: customCellModel?.link ?? "")
    }
    
    private func setupViews() {
        let views: [UIView] = [name, nameOffer, date, local, city, button]
        views.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        views.forEach{ addSubview($0) }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: frame.width / 100 * 2),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width / 100 * 10),
            name.bottomAnchor.constraint(equalTo: topAnchor, constant: frame.width / 100 * 10),
            
            nameOffer.topAnchor.constraint(equalTo: name.bottomAnchor, constant: frame.width / 100 * 5),
            nameOffer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width / 100 * 10),
            
            local.topAnchor.constraint(equalTo: nameOffer.bottomAnchor, constant: frame.width / 100 * 2),
            local.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width / 100 * 10),
            
            city.topAnchor.constraint(equalTo: nameOffer.bottomAnchor, constant: frame.width / 100 * 2),
            city.leadingAnchor.constraint(equalTo: local.trailingAnchor, constant: frame.width / 100 * 10),
            
            date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: frame.width / 100 * 5),
            date.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(frame.width / 100 * 10)),
            
            button.widthAnchor.constraint(equalTo: widthAnchor),
            button.heightAnchor.constraint(equalTo: heightAnchor),
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
    
    private func convertDate(with strDate: String ) -> String {
        
        let strRange = strDate.prefix(10)
        let str = String(strRange)
        let oldDateFormatter = DateFormatter()
        
        oldDateFormatter.dateFormat = "yyyy-MM-dd"
        let old = oldDateFormatter.date(from: str)
        
        guard let date = old else { return ""}
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd MMM"
        
        return dateFormatter.string(from: date)
    }
    
    private func setRead(state: String) -> UIColor {
        
        if state == "read" {
            return UIColor.gray
        } else {
            return Constants.colorDefault ?? UIColor.blue
        }
    }
}
