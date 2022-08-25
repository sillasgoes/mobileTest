//
//  Detail.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation

struct Detail: Codable {
    
    let distance: Int
    let lead_prince: Int
    let title: String
    let _embedded: EmbeddedInfo
    let _link: Link

    struct EmbeddedInfo: Codable {
        let info: [Info]
        let user: User
        let address: Address
        
        struct Info: Codable {
            let label: String
            let value: [String]
        }
        
        struct User: Codable {
            let name: String
            let email: String
            let _embedded: EmbeddedPhone
            
            struct EmbeddedPhone: Codable {
                let phones: [Phone]
                
                struct Phone: Codable {
                    let number: String
                }
            }
        }

        struct Address: Codable {
            let city: String
            let neighborhood: String
            let uf: String
            let geolocation: Geolocation
            
            struct Geolocation: Codable {
                let latitude: Int
                let longitude: Int
            }
        }
    }
    
    struct Link: Codable {
        var accept: Accept
        var reject: Reject
        
        struct Accept: Codable {
            var href: String
        }
        
        struct Reject: Codable {
            var href: String
        }
    }
}
