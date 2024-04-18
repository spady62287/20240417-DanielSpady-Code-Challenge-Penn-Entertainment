//
//  ViewController.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var launchScreenImageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!

    var dataSource: AirQualityDataSource?
    var mapView: AQMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Setup Data Source
        dataSource = AirQualityDataSource(delegate: self)
        
        // Setup Map View
        mapView = AQMapView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
        
        addMapView()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        showActionScreen()
    }
    
    private func showActionScreen() {
        let actionSheet = UIAlertController(title: "Edit Map", message: nil, preferredStyle: .alert)
                
        let editAction = UIAlertAction(title: "Edit", style: .default) { (action) in
            // Action Code
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // Cancel Code
        }
        
        actionSheet.addAction(editAction)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }
    
    private func addMapView() {
        if let mapView = mapView {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            view.addSubview(mapView)
            mapView.setMapConstraints(superView: view)
            mapView.addGestureRecognizer(tap)
        }
    }
    
    private func showMapView() {
        mapView?.isHidden = true
    }
    
    private func hideMapView() {
        mapView?.isHidden = false
    }
}

extension ViewController: ViewControllerDataSourceDelegate {
    
    private func setupCompletionBlock() {
        dataSource?.onSuccess = { [weak self] successValue in
            self?.showMapView()
            dump(successValue)
        }
        
        dataSource?.onFailure = { [weak self] failureValue in
            self?.hideMapView()
            dump(failureValue)
        }
    }

    func didStartLoading() {
        self.loadingLabel.text = "Loading Air Quality Coordinates"
        self.hideMapView()
    }

    func didFinishLoadingWithSuccess() {
        self.showMapView()
    }

    func didFinishLoadingWithError() {
        self.loadingLabel.text = "Request has Failed"
        self.hideMapView()
    }
}

