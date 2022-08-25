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
    
    public enum Detail {
        case Yes
        case No
    }
    
    enum ErrorUrl: Error {
        case invalidURL
        case invalidData
    }
}
