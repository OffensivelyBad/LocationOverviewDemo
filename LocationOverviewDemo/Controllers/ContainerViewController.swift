//
//  ContainerViewController.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 11/21/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    enum ViewState {
        case loading, error, completed
    }
    
    var viewState = ViewState.loading {
        didSet {
            updateView()
        }
    }
    
    private var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial view
        self.view.backgroundColor = .black
        
        // Get the data
        sendTestRequest()
        
    }
    
    private func updateView() {
        
        switch self.viewState {
        case .loading:
            setLoading()
        case .error:
            setError()
        case .completed:
            setCompleted()
        }
        
    }
    
    private func setLoading() {
        let loadingVC = LoadingViewController()
        self.transition(to: loadingVC)
    }
    
    private func setError() {
        let errorVC = ErrorViewController()
        self.transition(to: errorVC)
    }
    
    private func setCompleted() {
        let mainVC = MainViewController(locations: self.locations)
        self.transition(to: mainVC)
    }
    
}


// MARK: - Networking
extension ContainerViewController {
    
    private func sendTestRequest() {
        
        self.viewState = .loading
        
        DataManager.sendPostmanTestRequest { (locations) in
            
            guard locations.count > 0 else { self.viewState = .error; return }
            
            self.locations = locations
            self.viewState = .completed
            
        }
        
    }
    
}
