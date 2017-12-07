//
//  ErrorViewController.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 11/29/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        
        // Add an error label
        let label = getErrorLabel()
        self.view.addSubview(label)
    }
    
    private func getErrorLabel() -> UILabel {
        
        let labelWidth: CGFloat = 200
        let labelHeight: CGFloat = 50
        let xPosition = self.view.frame.midX - (labelWidth / 2)
        let yPosition = self.view.frame.midY - (labelHeight / 2)
        let label = UILabel(frame: CGRect(x: xPosition, y: yPosition, width: labelWidth, height: labelHeight))
        label.textColor = .white
        label.text = "There was an error!"
        return label
        
    }

}
