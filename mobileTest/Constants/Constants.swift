//
//  MobileTestConstants.swift
//  mobileTest
//
//  Created Sillas Santos on 24/08/22.
//

import Foundation
import UIKit

public struct Constants {
    
    static let colorDefault = UIColor(named: "BlueDefault")
    static let colorBackgroud = UIColor(named: "BlueBackground")
    
    static let fontCustomCell = UIFont(name: "Rubik", size: 10)
    static let colorFontCustomCell = UIColor.black
    
    static let colorBorderButton = UIColor.white
    
    static let entryPoint = "http://testemobile.getninjas.com.br/"
    
    public enum typeRequest: String, Any {
        case offers =  "offers"
        case leads  =   "leads"
        case offerWithDetail = "offer"
        case leadWithDetail = "lead"
    }
    
    static func fontCustomDetail(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Rubik", size: size) else { return .systemFont(ofSize: 10) }
        return font
    }
    
    static func textWithIcon(imageName: String, text: String) -> NSMutableAttributedString {
        
        let iconSize = CGRect(x: 0, y: -5, width: 20, height: 20)
        let image = UIImage(systemName: imageName)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        imageAttachment.bounds = iconSize
        
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "")
        completeText.append(attachmentString)
        
        let textAfterIcon = NSAttributedString(string: text)
        completeText.append(textAfterIcon)
        
        return completeText
    }
    
    public enum Detail {
        case Yes
        case No
    }
    
    enum ErrorUrl: Error {
        case invalidURL
        case invalidData
    }
}
