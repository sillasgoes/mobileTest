//
//  Leads.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation

struct Leads: Codable {
    let leads: [Lead]
    let _links: Links
    
}

struct Lead: Codable {
    let created_at: String
    let _embedded: Embedded
    let _links: Links
    
    struct Embedded: Codable {
        var address: Address
        var user: User
        let request: Request
        
        struct User: Codable {
            let name: String
            let email: String
        }
        
        struct Address: Codable {
            let city: String
            let neighborhood: String
            let uf: String
        }
        
        struct Request: Codable {
            let title: String
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
