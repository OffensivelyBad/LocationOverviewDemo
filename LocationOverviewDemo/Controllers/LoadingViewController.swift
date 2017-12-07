//
//  LoadingViewController.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 11/29/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        customizeView()
    }

    private func customizeView() {
        self.view.backgroundColor = .black
        let loadingIndicator = getLoadingIndicator()
        self.view.addSubview(loadingIndicator)
    }
    
    private func getLoadingIndicator() -> UIActivityIndicatorView {
        let indicatorWidthAndHeight: CGFloat = 100
        let xPosition = self.view.frame.midX - (indicatorWidthAndHeight / 2)
        let yPosition = self.view.frame.midY - (indicatorWidthAndHeight / 2)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: xPosition, y: yPosition, width: indicatorWidthAndHeight, height: indicatorWidthAndHeight))
        loadingIndicator.color = .white
        loadingIndicator.startAnimating()
        return loadingIndicator
    }
    
}
