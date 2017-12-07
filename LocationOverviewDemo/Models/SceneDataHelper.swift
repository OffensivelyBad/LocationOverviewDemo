//
//  SceneDataHelper.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 12/7/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import Foundation
import SpriteKit

protocol SceneDataHelper {
    var locations: [Location] { get set }
    var sceneSize: CGSize { get set }
    
    func getLocationNodes() -> [SKNode]
}
