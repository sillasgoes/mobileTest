//
//  URLSession+Extends.swift
//  mobileTest
//
//  Created by Sillas Santos on 25/08/22.
//

import Foundation
import MapKit

extension URLSession {
    
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
            guard let url = url else {
                completion(.failure(Constants.ErrorUrl.invalidURL))
                           return
            }
            
           let task = dataTask(with: url) { data, _, error  in
                guard let data = data else {
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(Constants.ErrorUrl.invalidData))
                    }
                    return
                }
                do {
                    let result = try JSONDecoder().decode(expecting, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
         task.resume()
        }
}

extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

