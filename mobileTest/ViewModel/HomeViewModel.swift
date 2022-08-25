//
//  HomeViewModel.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation

class HomeViewModel {
    
    
    private func makeRequest(){
        
        let link = URL(string: "http://testemobile.getninjas.com.br")!
        
        let task = URLSession.shared.dataTask(with: link) { (data, urlResponse, error) in
            
            print("Response \(String(describing: urlResponse))")
            print("Error \(String(describing: error))")
        }
        task.resume()
        
    }
}
