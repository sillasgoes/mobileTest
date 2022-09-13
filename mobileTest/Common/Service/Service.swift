//
//  Service.swift
//  mobileTest
//
//  Created by Sillas Santos on 28/08/22.
//

import Foundation
import Alamofire

// MARK: - Protocol
protocol GenericService: AnyObject {
    typealias completion<T> = (_ result: T, _ failure: Error?) -> Void
}

protocol ServiceDelegate: GenericService {
    func getLinksFromApi(completion: @escaping completion<Link?>)
}
// MARK: - Enum

enum ErrorURL: Error {
    case urlNotFound
    case fileDecodingFailed
}

class Service: ServiceDelegate {
    
    func getLinksFromApi(completion: @escaping completion<Link?>) {
        AF.request(Constants.entryPoint)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Link.self) { response in
                guard let response = response.value else {
                    return completion(nil, ErrorURL.urlNotFound)
                }
                completion(response, nil)
                print("Os dados chegaram: \(response)")
            }
    }
    
    func getOfferFromApi(completion: @escaping completion<Offers?>) {
        getLinksFromApi { result, failure in
            
            guard let url = URL(string: result?.links.offers.href ?? "" ) else  {
                return
            }
            
            AF.request(url)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: Offers.self) { response in
                    guard let response = response.value else {
                        return completion(nil, ErrorURL.urlNotFound)
                    }
                    completion(response, nil)
                }
        }
    }
    
    func getLeadsFromApi(completion: @escaping completion<Leads?>) {
        getLinksFromApi { result, failure in
            
            guard let url = URL(string: result?.links.leads.href ?? "" ) else  {
                return
            }
            
            AF.request(url)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: Leads.self) { response in
                    guard let response = response.value else {
                        return completion(nil, ErrorURL.urlNotFound)
                    }
                    completion(response, nil)
                }
        }
    }
    
    func getDetailFromApi(url: URL?, completion: @escaping completion<Detail?>) {
        getLinksFromApi { result, failure in
            
            guard let url = url else { return }
            
            AF.request(url)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: Detail.self) { response in
                    guard let response = response.value else {
                        return completion(nil, ErrorURL.urlNotFound)
                    }
                    completion(response, nil)
                }
        }
    }
}
