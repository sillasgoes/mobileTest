//
//  Service.swift
//  mobileTest
//
//  Created by Sillas Santos on 28/08/22.
//

import Foundation

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
        guard let url = URL(string: Constants.entryPoint) else {
            return completion(nil, ErrorURL.urlNotFound)
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if error == nil {
                guard let data = data else {
                    return
                }
                do {
                    let data = try JSONDecoder().decode(Link.self, from: data)
                    completion(data, nil)
                } catch {
                    completion(nil, ErrorURL.urlNotFound)
                }
            }
        }
        task.resume()
    }
    
    func getOfferFromApi(completion: @escaping completion<Offers?>) {
        
        getLinksFromApi { result, failure in
            
            guard let url = URL(string: result?.links.offers.href ?? "" ) else  {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                
                if error == nil {
                    guard let data = data else {
                        return
                    }
                    do {
                        let data = try JSONDecoder().decode(Offers.self, from: data)
                        completion(data, nil)
                    } catch {
                        completion(nil, ErrorURL.urlNotFound)
                    }
                }
            }
            task.resume()
        }
    }
    
    func getLeadsFromApi(completion: @escaping completion<Leads?>) {
        getLinksFromApi { result, failure in
            
            guard let url = URL(string: result?.links.leads.href ?? "" ) else  {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if error == nil {
                    guard let data = data else {
                        return
                    }
                    do {
                        let data = try JSONDecoder().decode(Leads.self, from: data)
                        completion(data, nil)
                    } catch {
                        completion(nil, ErrorURL.urlNotFound)
                    }
                }
            }
            task.resume()
        }
    }
    
    func getDetailFromApi(url: URL?, completion: @escaping completion<Detail?>) {
        
        getLinksFromApi { result, failure in
            
            guard let url = url else { return }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if error == nil {
                    guard let data = data else {
                        return
                    }
                    do {
                        let data = try JSONDecoder().decode(Detail.self, from: data)
                        print("Os Dados \(data)")
                        completion(data, nil)
                    } catch let error {
                        print("Erro da requisição \(error)")
                        completion(nil, error)
                    }
                }
            }
            task.resume()
        }
    }
}
