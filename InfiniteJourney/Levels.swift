//
//  Levels.swift
//  InfiniteJourney
//
//  Created by Matthew swenson on 5/15/17.
//  Copyright © 2017 ADB. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Levels: SKScene {
    var levelDistances: [Int]=[500, 750, 1000, 1500, 2000, 3000, 4000, 5000, 7000, 9000]
    var levelMessages: [String]=["Old man 1: Oh, another traveler heading to the Dangajee River? All I can tell you is that you are on the right path, and there is a long way ahead of you.", "Old man 2: I didn't expect you to be this consistent. Alright, considering you are determined, I will tell you this much: you will see 9 of me before you reach your destination. You have seen 2 so far. Good luck!", "Old man 3: I heard your wife and three children were killed during a bandit raid on their cattle ranching town on the frontier. What a tragedy... I promise you will find what you need at the Dangajee River.", "Old man 4: I hope you didn't sit down in that burned-down church "]
    func getLevelDistances() -> [Int]
    {
        return levelDistances
    }

    override func didMove(to view: SKView)
    {
           let multiLabel = SKMultilineLabel(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", labelWidth: 250, pos: CGPoint(x: size.width / 2, y: size.height / 2))
        self.addChild(multiLabel)
    }
}
