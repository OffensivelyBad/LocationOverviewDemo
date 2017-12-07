//
//  LocationScene.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 11/29/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import SpriteKit
import GameplayKit

class LocationScene: SKScene {
    
    public var dataManager: SceneDataManager?
    private var cameraIsZoomed = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        setupCamera()
//        createBlocks(2000)
        createNodes()
        
        // create gesture to zoom
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(LocationScene.handlePinch(_:)))
        self.view?.addGestureRecognizer(pinchGesture)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, touch.tapCount == 2 else { return }
        self.cameraIsZoomed = !self.cameraIsZoomed
        if self.cameraIsZoomed {
            // Zoom in on the tap point
            zoomCameraInOnPoint(touch.location(in: self))
        }
        else {
            // Zoom out
            zoomCameraOut()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard self.cameraIsZoomed else { return }
        guard let touch = touches.first else { return }
        panCameraToPoint(touch.previousLocation(in: self), endPoint: touch.location(in: self))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

// MARK: - Camera
extension LocationScene {
    
    func setupCamera() {
        
        let camera = SKCameraNode()
        self.camera = camera
        guard let cam = self.camera else { return }
        self.addChild(cam)
        
    }
    
    func zoomCameraInOnPoint(_ point: CGPoint) {
        guard let cam = self.camera else { return }
        let scale = SKAction.scale(to: 0.25, duration: 0.25)
        let position = SKAction.move(to: point, duration: 0.25)
        cam.run(scale)
        cam.run(position)
    }
    
    func zoomCameraOut() {
        guard let cam = self.camera else { return }
        let scale = SKAction.scale(to: 1, duration: 0.25)
        let position = SKAction.move(to: CGPoint.zero, duration: 0.25)
        cam.run(scale)
        cam.run(position)
    }
    
    func panCameraToPoint(_ startPoint: CGPoint, endPoint: CGPoint) {
        guard let cam = self.camera else { return }
        let changeX = startPoint.x - endPoint.x
        let changeY = startPoint.y - endPoint.y
        var newX = cam.position.x + changeX
        var newY = cam.position.y + changeY
        
        // Clamp the camera position to not allow the view to move more than halfway off the screen
        if abs(newX) > self.size.width / 2 {
            newX = newX < 0 ? -self.size.width / 2 : self.size.width / 2
        }
        if abs(newY) > self.size.height / 2 {
            newY = newY < 0 ? -self.size.height / 2 : self.size.height / 2
        }
        
        cam.position.x = newX
        cam.position.y = newY
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        guard let cam = self.camera else { return }
        let pinch = SKAction.scale(by: sender.scale, duration: 0.0)
        cam.run(pinch.reversed())
        sender.scale = 1
        
        if sender.state == .ended {
            self.cameraIsZoomed = cam.xScale < 1 ? true : false
            if !self.cameraIsZoomed {
                // Prevent the camera from zooming too far out
                zoomCameraOut()
            }
            else if cam.xScale < 0.25 {
                // Prevent the camera from zooming too far in
                zoomCameraInOnPoint(cam.position)
            }
        }
        
    }
    
}

// MARK: - DataManager
extension LocationScene {
    
    func createNodes() {
        
        let nodesToCreate = self.dataManager?.getLocationNodes()
        guard let nodes = nodesToCreate, nodes.count > 0 else { return }
        for node in nodes {
            self.addChild(node)
        }
        
    }
    
}

