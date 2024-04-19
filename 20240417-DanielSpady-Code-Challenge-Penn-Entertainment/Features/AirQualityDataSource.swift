//
//  AirQualityDataSource.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

import Foundation

class AirQualityDataSource: ViewControllerDataSource {
    
    var onSuccess: ((MeasurementDataModel?) -> Void)?
    var onFailure: ((Error?) -> Void)?
    
    func getAirQuality(longitude: String, latitude: String) {
        taskStarted()
        
        let request = MeasurementRequest()
        request.lat = latitude
        request.lon = longitude
        
        AirQualityUtility.measurementJSONObject(request) { response in
            DispatchQueue.main.async { [weak self] in
                if let error = response.error {
                    self?.taskFailed(error: error)
                    self?.onFailure?(error)
                } else if response.result == nil {
                    self?.onFailure?(nil)
                    self?.taskFailed(error: nil)
                } else if let result = response.result {
                    self?.onSuccess?(result)
                    self?.taskSucceeded()
                }
            }
        }
    }
}
