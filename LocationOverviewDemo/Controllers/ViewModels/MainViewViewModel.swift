//
//  MainViewViewModel.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 12/8/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import Foundation
import SpriteKit

struct MainViewViewModel: MainViewViewModelProtocol {
    
    var locations = [Location]()
    init(locations: [Location]) {
        self.locations = locations
    }
    
    mutating func setupSceneView(for frame: CGRect) -> SKView {
        
        let sceneView = SKView(frame: frame)
        if let scene = SKScene(fileNamed: "LocationScene") as? LocationScene {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Set the data for the scene
            scene.dataManager = SceneDataManager(locations: self.locations, sceneSize: scene.size)
            
            // Present the scene
            sceneView.presentScene(scene)
        }
        
        sceneView.ignoresSiblingOrder = true
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        return sceneView
        
    }
    
}
