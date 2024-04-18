//
//  AirQualityDataSource.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

import Foundation

class AirQualityDataSource: ViewControllerDataSource {
    
    var onSuccess: ((String?) -> Void)?
    var onFailure: ((String?) -> Void)?
    
    func getAirQuality() {
        taskStarted()
    }
}
