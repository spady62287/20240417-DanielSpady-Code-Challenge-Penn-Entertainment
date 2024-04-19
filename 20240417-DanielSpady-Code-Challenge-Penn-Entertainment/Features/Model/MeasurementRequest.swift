//
//  MeasurementRequest.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

import Foundation

class MeasurementRequest: BaseRequest {
    override var url: URL? {
        let urlString = BaseService.airQualityEndpoint
        return URL(string: urlString)
    }
}
