//
//  AirQualityUtility.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

import Foundation

class AirQualityUtility: BaseService {
    @discardableResult static func measurementJSONObject(_ request: BaseRequest = BaseRequest(),
                                                         dispatchQueue: DispatchQueue? = BaseService.dispatchQueue,
                                                         completionHandler: @escaping (MeasurementResponse) -> Void) -> URLSessionDataTask? {
        var task: URLSessionDataTask?
        task = BaseService.makeGetRequest(with: request, completeOn: nil) { (data, response, error) in
            let response = MeasurementResponse(request: request,
                                               result: MeasurementDataModel.fromJSON(data),
                                               task: task,
                                               data: data,
                                               response: response as? HTTPURLResponse,
                                               error: error)
            completionHandler(response)
        }
        task?.resume()
        return task
    }
}
