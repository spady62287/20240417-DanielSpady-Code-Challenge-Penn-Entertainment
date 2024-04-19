//
//  ViewController+ViewControllerDataSourceDelegate.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

extension ViewController: ViewControllerDataSourceDelegate {
    func setupCompletionBlock() {
        dataSource?.onSuccess = { [weak self] successValue in
            if let overall_aqi = successValue?.overall_aqi {
                self?.addAnnotationToMapView(value: "Overal Air Quality: \(overall_aqi)")
            }
        }
        
        dataSource?.onFailure = { [weak self] failureValue in
            self?.hideMapView()
        }
    }

    func didStartLoading() {
        self.loadingLabel.text = "Loading Air Quality Coordinates"
        self.loadingLabel.textColor = .blue
        self.hideMapView()
    }

    func didFinishLoadingWithSuccess() {
        self.showMapView()
    }
    
    func didFinishLoadingWithError(error: Error?) {
        if let error = error {
            self.loadingLabel.text = error.localizedDescription
        } else {
            self.loadingLabel.text = "Request Has Failed"
        }
        self.loadingLabel.textColor = .red
        self.hideMapView()
    }
}
