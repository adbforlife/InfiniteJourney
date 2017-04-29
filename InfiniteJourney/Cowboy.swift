//
//  Cowboy.swift
//  InfiniteJourney
//
//  Created by ADB on 2/6/17.
//  Copyright © 2017 ADB. All rights reserved.
//

import Foundation
import SpriteKit

enum cowboyState    {
    case Idle, Running, Sliding
}

class Cowboy: SKSpriteNode  {
    
    var characterState: cowboyState = .Idle
    var currentSpeed = 1
    var idleSpeed = 1
    var clickPoint = 1
    var runningSpeed = 2
    var slidingSpeed = 3
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
