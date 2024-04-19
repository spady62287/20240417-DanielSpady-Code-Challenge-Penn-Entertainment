//
//  ViewController.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-17.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var launchScreenImageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var ctaButton: UIButton!
    
    var dataSource: AirQualityDataSource?
    var mapView: AQMapView?
    var currentLocation: CLLocation!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        // Setup Data Source
        dataSource = AirQualityDataSource(delegate: self)
        
        // Setup Completion Block
        setupCompletionBlock()
        
        // Setup Map View
        mapView = AQMapView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
    }
    
    // MARK: - Map View
    func addMapView() {
        if let mapView = mapView {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            tap.numberOfTapsRequired = 3
            view.addSubview(mapView)
            mapView.setMapConstraints(superView: view)
            mapView.addGestureRecognizer(tap)
        }
    }

    func showMapView() {
        mapView?.isHidden = false
    }
    
    func hideMapView() {
        mapView?.isHidden = true
    }
    
    func addAnnotationToMapView(value: String) {
        mapView?.addCoordinate(title: value,
                               latitude: currentLocation.coordinate.latitude,
                               longitude: currentLocation.coordinate.longitude)
        
        addMapView()
        if let annotations = self.mapView?.annotations {
            self.mapView?.showAnnotations(annotations, animated: true)
        }
    }
    
    // MARK: - Button Tap
    @IBAction func ctaButtonTapped(_ sender: Any) {
        showMenuAlert()
    }
    
    // MARK: - Gesture Alert
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        dismissMapAlert()
    }
    
    // MARK: - Core Location Authorize
    func requestLocationAuthorization() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    // MARK: - Data Source Call
    func getAirQuality() {
        if self.locationManager.authorizationStatus == .authorizedWhenInUse ||
            self.locationManager.authorizationStatus ==  .authorizedAlways {
            self.currentLocation = self.locationManager.location
            self.dataSource?.getAirQuality(longitude: "\(self.currentLocation.coordinate.longitude)",
                                           latitude: "\(self.currentLocation.coordinate.latitude)")
        } else {
            showLocationAuthorizationAlert()
        }
    }
    
    // MARK: - Menu Alerts
    func showLocationAuthorizationAlert() {
        let actionSheet = UIAlertController(title: "Allow App Location Auth", message: nil, preferredStyle: .alert)
        
        let requestAuth = UIAlertAction(title: "Allow Location Auth", style: .default) { (action) in
            // Action Code
            self.requestLocationAuthorization()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // Cancel Code
        }
        
        actionSheet.addAction(requestAuth)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }
    
    private func dismissMapAlert() {
        let actionSheet = UIAlertController(title: "Dismiss Map", message: nil, preferredStyle: .alert)
                
        let editAction = UIAlertAction(title: "Dismiss", style: .default) { (action) in
            // Action Code
            self.hideMapView()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // Cancel Code
        }
        
        actionSheet.addAction(editAction)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }
    
    func showMenuAlert() {
        let actionSheet = UIAlertController(title: "Annotate Map", message: nil, preferredStyle: .alert)
        
        let requestAuth = UIAlertAction(title: "Authorize Location", style: .default) { (action) in
            // Action Code
            self.requestLocationAuthorization()
        }
                
        let editAction = UIAlertAction(title: "Check Air Quality", style: .default) { (action) in
            // Action Code
            self.getAirQuality()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // Cancel Code
        }
        
        if locationManager.authorizationStatus == .notDetermined {
            actionSheet.addAction(requestAuth)
        }
        
        actionSheet.addAction(editAction)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }
}
