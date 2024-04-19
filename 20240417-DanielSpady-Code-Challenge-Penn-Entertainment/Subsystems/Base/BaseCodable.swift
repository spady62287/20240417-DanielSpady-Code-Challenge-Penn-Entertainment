//
//  BaseCodable.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

import Foundation

protocol BaseCodable: Codable {
    // Generic JSON decode of data.
    static func fromJSON<T: Decodable>(_ data: Data?) -> T?
}

// Default implementation of JSON wrapper
extension BaseCodable {
    
    // Returns default JSONDecoder. Override for custom configurations
    static var jsonDecoder: JSONDecoder {
        let result: JSONDecoder = JSONDecoder()
        
        // make this our default.
        result.dateDecodingStrategy = .formatted(DateFormatter.init())
        
        return result
    }
    
    // Returns Generic JSON
    static func fromJSON<T: Decodable>(_ data: Data?) -> T? {
        guard let data = data else {
            return nil
        }
                
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}
