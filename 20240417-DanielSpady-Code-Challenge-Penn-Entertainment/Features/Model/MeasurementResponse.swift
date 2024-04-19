//
//  MeasurementResponse.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

import Foundation

struct MeasurementResponse: BaseResponse {
    var request: BaseRequest?
    var task: URLSessionDataTask?
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    var result: MeasurementDataModel?
    
    public init() {
        self.request = Request()
        self.task = nil
        self.data = nil
        self.response = nil
        self.error = nil
        result = nil
    }
}
