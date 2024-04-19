//
//  ViewControllerDataSource.swift
//  20240417-DanielSpady-Code-Challenge-Penn-Entertainment
//
//  Created by Daniel Spady on 2024-04-18.
//

import Foundation

protocol ViewControllerDataSourceDelegate: AnyObject {
    func didStartLoading()
    func didFinishLoadingWithSuccess()
    func didFinishLoadingWithError(error: Error?)
}

class ViewControllerDataSource {
    weak var delegate: ViewControllerDataSourceDelegate?
    
    init(delegate: ViewControllerDataSourceDelegate) {
        self.delegate = delegate
    }
    
    func taskStarted() {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.didStartLoading()
        }
    }
        
    func taskSucceeded() {
        delegate?.didFinishLoadingWithSuccess()
    }
    
    func taskFailed(error: Error?) {
        delegate?.didFinishLoadingWithError(error: error)
    }
}
