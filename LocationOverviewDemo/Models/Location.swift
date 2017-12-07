//
//  Location.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 11/29/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import Foundation

struct Location: Codable {
    
    var locationName: String = ""
    var capacity: Int = 0
    var units: Int = 0
    var percentToCapacity: Int {
        guard self.capacity > 0 else { return 0 }
        return Int(self.units / self.capacity) * 100
    }
    
    enum CodingKeys: String, CodingKey {
        case locationName = "location"
        case capacity
        case units
    }
    
}
