//
//  SceneDataManager.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 12/7/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import Foundation
import SpriteKit

struct SceneDataManager: SceneDataHelper {
    
    var locations: [Location]
    var sceneSize: CGSize
    
    public func getLocationNodes() -> [SKNode] {
        return createLocationNodes()
    }
    
    private func createLocationNodes() -> [SKNode] {
        
        let halfScreenWidth = self.sceneSize.width / 2
        let halfScreenHeight = self.sceneSize.height / 2
        
        var currentX = -halfScreenWidth + (Block.Size.width / 2)
        var currentY = halfScreenHeight - (Block.Size.height / 2)
        
        var nodeArray = [SKNode]()
        
        for location in self.locations {

            if currentX + Block.Size.width > halfScreenWidth {
                currentY -= Block.Size.height
                currentX = -halfScreenWidth + (Block.Size.width / 2)
            }
            let color = BlockColor.init(forPercentToCapacity: location.capacity).color
            let block = SKSpriteNode(color: color, size: Block.Size)
            block.name = location.locationName
            block.position = CGPoint(x: currentX, y: currentY)

            let labelNode = SKLabelNode(text: location.locationName)
            labelNode.fontSize = 4
            labelNode.position = CGPoint.zero
            block.addChild(labelNode)

            nodeArray.append(block)

            currentX += Block.Size.width
        }
        
        return nodeArray
        
    }
    
}
