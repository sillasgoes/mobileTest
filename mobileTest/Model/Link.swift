//
//  Link.swift
//  mobileTest
//
//  Created by Sillas Santos on 26/08/22.
//

import Foundation

struct Link: Codable {
    let links: Types
    
    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }
}

struct Types: Codable {
    var leads: Href
    var offers: Href

    struct Href: Codable {
        var href: String
    }
}
