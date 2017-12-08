//
//  MainViewController.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 11/29/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import UIKit
import SpriteKit

protocol MainViewViewModelProtocol {
    var locations: [Location] { get set }
    mutating func setupSceneView(for frame: CGRect) -> SKView
}

class MainViewController: UIViewController {
    
    private var viewModel: MainViewViewModelProtocol!
    convenience init(viewModel: MainViewViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        self.view.addSubview(self.viewModel.setupSceneView(for: self.view.frame))
        
    }
    
}
