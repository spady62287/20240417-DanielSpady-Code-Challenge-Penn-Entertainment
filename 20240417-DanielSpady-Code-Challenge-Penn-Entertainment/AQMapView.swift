//
//  AQMapView.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-17.
//

import UIKit
import MapKit

class AQMapView: MKMapView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setMapConstraints(superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
