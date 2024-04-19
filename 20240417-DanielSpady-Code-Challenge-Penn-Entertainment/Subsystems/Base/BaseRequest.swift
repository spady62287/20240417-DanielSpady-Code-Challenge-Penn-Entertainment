//
//  BaseRequest.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

import Foundation

class BaseRequest {
    
    var lat: String?
    var lon: String?
    
    var url: URL? {
        return nil
    }
    
    var request: URLRequest? {
        if let url = url {
            let request = URLRequest(url: url)
            
            return request
        }
        return nil
    }
    
    var getRequest: URLRequest? {
        if let url = url {
            if let latValue = lat,
               let lonValue = lon {
                let urlComponents = NSURLComponents(string: url.absoluteString)
                if let urlComponents = urlComponents {
                    urlComponents.queryItems = [
                        URLQueryItem(name: "lat", value: latValue),
                        URLQueryItem(name: "lon", value: lonValue)
                    ]
                    
                    if let queUrl = urlComponents.url {
                        var request = URLRequest(url: queUrl)
                        request.httpMethod = "GET"
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        request.setValue("JSr/gTPTN8BPggstCCW4mg==O0dRI5IkOSdAGv7u", forHTTPHeaderField: "X-Api-Key")
                                    
                        return request
                    }
                }
            }
        }
        
        return nil
    }
}
