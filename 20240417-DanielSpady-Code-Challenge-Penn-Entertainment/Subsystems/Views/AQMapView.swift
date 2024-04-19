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
    
    func addCoordinate(title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let newPoint = MKPointAnnotation()
        newPoint.title = title
        newPoint.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.addAnnotation(newPoint)
    }
    
    func setMapConstraints(superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    override func view(for annotation: any MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = self.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
