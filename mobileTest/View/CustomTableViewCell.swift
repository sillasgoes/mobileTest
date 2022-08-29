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
    private var city = UILabel()
    
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
         
        let color = setRead(state: customCellModel?.state ?? "")
        
        name.textColor = Constants.colorFontCustomCell
        name.font = UIFont(name: "Rubik",
                           size: 14)
        name.text = customCellModel?.name
        
        nameOffer.textColor = Constants.colorFontCustomCell
        nameOffer.font = Constants.fontCustomCell
        nameOffer.text = customCellModel?.nameOffer
        nameOffer.attributedText = Constants.textWithIcon(imageName: "person.fill", text: customCellModel?.nameOffer ?? "", width: 13, height: 13, y: -2, color: color)
        
        
        date.textColor = Constants.colorFontCustomCell
        date.font = Constants.fontCustomCell
        date.attributedText = Constants.textWithIcon(imageName: "person.fill", text: convertDate(with: customCellModel?.date ?? ""), width: 13, height: 13, y: -2, color: color)
        
        
        
        local.textColor = Constants.colorFontCustomCell
        local.font = Constants.fontCustomCell
        local.attributedText = Constants.textWithIcon(imageName: "map.fill", text: customCellModel?.local ?? "", width: 13, height: 13, y: -2, color: color)
        
    
        
        city.textColor = Constants.colorFontCustomCell
        city.font = Constants.fontCustomCell
        city.text = customCellModel?.city
        
    }
    
 
    // MARK: - Private Funcs & Funcs
    
    private func setupViews() {
        let views: [UIView] = [name, nameOffer, date, local, city]
        views.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        views.forEach{ addSubview($0) }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            name.bottomAnchor.constraint(equalTo: topAnchor, constant: 30),
            
            nameOffer.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            nameOffer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            local.topAnchor.constraint(equalTo: nameOffer.bottomAnchor, constant: 10),
            local.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            city.topAnchor.constraint(equalTo: nameOffer.bottomAnchor, constant: 10),
            city.leadingAnchor.constraint(equalTo: local.trailingAnchor, constant: 10),
            
            date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
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
   
    func convertDate(with strDate: String ) -> String {
        
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
    
    func setRead(state: String) -> UIColor {
       
        if state == "read" {
            return UIColor.gray
        } else {
           return UIColor.blue
        }
    }
}
