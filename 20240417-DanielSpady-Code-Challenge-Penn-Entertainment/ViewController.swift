//
//  ViewController.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var launchScreenImageView: UIImageView!
    @IBOutlet weak var swipeUpLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        showMapView()
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
    
    private func showMapView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        let mapView = AQMapView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
        view.addSubview(mapView)
        mapView.setMapConstraints(superView: view)
        
        mapView.addGestureRecognizer(tap)
    }
}

