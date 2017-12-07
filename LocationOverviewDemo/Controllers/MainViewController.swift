//
//  MainViewController.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 11/29/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import UIKit
import SpriteKit

class MainViewController: UIViewController {

    private var locations = [Location]()
    convenience init(locations: [Location]) {
        self.init()
        self.locations = locations
    }
    
    private var sceneView: SKView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        
        // Setup the sceneview
        setupSceneView()
        
    }

    private func setupSceneView() {
        
        self.sceneView = SKView(frame: self.view.frame)
        guard let sView = self.sceneView else { fatalError("Can't present MainViewController.sceneView") }
        self.view.addSubview(sView)
        
        if let scene = SKScene(fileNamed: "LocationScene") as? LocationScene {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
        
            // Set the data for the scene
            scene.dataManager = SceneDataManager(locations: self.locations, sceneSize: scene.size)
            
            // Present the scene
            sView.presentScene(scene)
        }
        
        sView.ignoresSiblingOrder = true
        
        sView.showsFPS = true
        sView.showsNodeCount = true
        
    }
    
}
