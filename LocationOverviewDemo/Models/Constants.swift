//
//  Constants.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 12/7/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import UIKit

enum API {
    static let mockURL = "https://08fefab6-a35c-4fdf-a80d-f384a8728dfe.mock.pstmn.io/get"
}

enum BlockColor {
    
    case Low
    case Medium
    case High
    case Full
    
    var color: UIColor {
        switch self {
        case .Low:
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case .Medium:
            return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case .High:
            return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case .Full:
            return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    init(forPercentToCapacity percent: Int) {
        switch percent {
        case 0..<33:
            self = .Low
        case 33..<66:
            self = .Medium
        case 66..<100:
            self = .High
        case 100...:
            self = .Full
        default:
            self = .Full
        }
    }
    
}

enum Block {
    
    static let Size = CGSize(width: 20, height: 10)
    
    
}
