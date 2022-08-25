//
//  Offers.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation
import UIKit

struct Offers: Codable {
    var offers: [Offers]
    var _links: Links
    
    struct Offers: Codable {
        let state: String
        let _embedded: EmbeddedRequest
        let _links: Links
    }

    struct EmbeddedRequest: Codable {
        let request: Request
    }

    struct Request: Codable {
        let created_at: String
        let title: String
        let _embedded: EmbeddedUser
    }

    struct EmbeddedUser: Codable {
        var user: User
        var address: Address
        
        struct User: Codable {
            let name: String
        }
        
        struct Address: Codable {
            let city: String
            let neighborhood: String
            let uf: String
        }
    }

    struct Links: Codable {
        let self_ : _Self
        
        struct _Self: Codable {
            let href: String
        }
        
        enum CodingKeys: String, CodingKey {
            case self_ = "self"
        }
    }
}
