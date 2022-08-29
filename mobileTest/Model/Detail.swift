//
//  Detail.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation

struct Detail: Codable {
    
    let distance: Int
    let lead_price: Int
    let title: String
    let _embedded: EmbeddedInfo
    struct EmbeddedInfo: Codable {
        let info: [Info]
        let user: User
        let address: Address
        
        struct Info: Codable {
            let label: String
            //  var value: [String]?
            
            // Não consegui implementar a lógica do decode para os dois casos Array e String
            // Os as variaveis e elementos visuais para implementar o value estão prontos
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
                let latitude: Double
                let longitude: Double
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

struct DetailModel {
    var distance: Int
    var lead_price: Int
    var title: String
    var user: String
    var neighborhood: String
    var city: String
    var label1: String
    var label2: String
    var label3: String
    var label4: String
    var label5: String
    var label6: String
    var label7: String
    var value1: String
    var value2: String
    var value3: String
    var value4: String
    var value5: String
    var value6: String
    var value7: String
    var phone: String
    var email: String
    var latitude: Double
    var longitude: Double
}
