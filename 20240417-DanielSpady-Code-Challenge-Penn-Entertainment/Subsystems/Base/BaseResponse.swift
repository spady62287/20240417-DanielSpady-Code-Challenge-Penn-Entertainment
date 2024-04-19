//
//  BaseResponse.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

import Foundation

protocol BaseResponse {
    
    associatedtype Request: BaseRequest
    var request: Request? { get set }
    
    associatedtype Payload
    var result: Payload? { get set }
    
    var task: URLSessionDataTask? { get set }
    var data: Data? { get set }
    var response: HTTPURLResponse? { get set }
    var error: Error? { get set }
    
    init()
}

extension BaseResponse {
    
    init(request: Request,
         result: Payload?,
         task: URLSessionDataTask?,
         data: Data?,
         response: HTTPURLResponse?,
         error: Error?) {
        self.init()
        self.request = request
        self.result = result
        self.task = task
        self.data = data
        self.response = response
        self.error = error
    }
}
