//
//  MainMenu.swift
//  InfiniteJourney
//
//  Created by Matthew swenson on 5/6/17.
//  Copyright © 2017 ADB. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class MainMenuScene: SKScene
{
    let speedChangeFactor: CGFloat = 1.5
    var groundScrollSpeed: CGFloat = 900
    var mountainScrollSpeed: CGFloat = 300
    var cactusScrollSpeed: CGFloat = 450
    var cloudScrollSpeed: CGFloat = 100
    let staticDelta: TimeInterval = 1.0/60.0
    var scrollLayerFast: SKNode!
    var scrollLayerMediumFast: SKNode!
    var scrollLayerMedium: SKNode!
    var scrollLayerSlow: SKNode!
    var scoreLabel: SKLabelNode!
    var animationStartTime: TimeInterval = 0.0

    override func didMove(to view: SKView) {
        scrollLayerFast = self.childNode(withName: "scrollLayerFast")
        scrollLayerMediumFast = self.childNode(withName: "scrollLayerMediumFast")
        scrollLayerMedium = self.childNode(withName: "scrollLayerMedium")
        scrollLayerSlow = self.childNode(withName: "scrollLayerSlow")
    }
    
    override func update(_ currentTime: TimeInterval) {
        scrollWorld()
    }

    func scrollWorld()
    {
        /* Scroll World */
        scrollLayerFast.position.x -= groundScrollSpeed * CGFloat(1.0 / 60.0)
        let ground1 = scrollLayerFast.children[0] as! SKSpriteNode
        let ground2 = scrollLayerFast.children[1] as! SKSpriteNode
        /* Get ground node position, convert node position to scene space */
        var groundPosition = scrollLayerFast.convert(ground1.position, to: self)
        /* Check if ground sprite has left the scene */
        if groundPosition.x <= -ground1.size.width {
            /* Reposition ground sprite to the second starting position */
            let newPosition = CGPoint(x: ground1.size.width + scrollLayerFast.convert(ground2.position, to: self).x, y: groundPosition.y)
            /* Convert new node position back to scroll layer space */
            ground1.position = self.convert(newPosition, to: scrollLayerFast)
        }
        groundPosition = scrollLayerFast.convert(ground2.position, to: self)
        /* Check if ground sprite has left the scene */
        if groundPosition.x <= -ground2.size.width {
            /* Reposition ground sprite to the second starting position */
            let newPosition = CGPoint(x: ground2.size.width + scrollLayerFast.convert(ground1.position, to: self).x, y: groundPosition.y)
            /* Convert new node position back to scroll layer space */
            ground2.position = self.convert(newPosition, to: scrollLayerFast)
        }
        scrollLayerMediumFast.position.x -= mountainScrollSpeed * CGFloat(1.0 / 60.0)
        let mountain1 = scrollLayerMediumFast.children[0] as! SKSpriteNode
        let mountain2 = scrollLayerMediumFast.children[1] as! SKSpriteNode
        /* Get ground node position, convert node position to scene space */
        var mountainPosition = scrollLayerMediumFast.convert(mountain1.position, to: self)
        /* Check if ground sprite has left the scene */
        if mountainPosition.x <= -mountain1.size.width {
            /* Reposition ground sprite to the second starting position */
            let newPosition = CGPoint(x: mountain1.size.width + scrollLayerMediumFast.convert(mountain2.position, to: self).x, y: mountainPosition.y)
            /* Convert new node position back to scroll layer space */
            mountain1.position = self.convert(newPosition, to: scrollLayerMediumFast)
        }
        mountainPosition = scrollLayerMediumFast.convert(mountain2.position, to: self)
        /* Check if ground sprite has left the scene */
        if mountainPosition.x <= -mountain2.size.width {
            /* Reposition ground sprite to the second starting position */
            let newPosition = CGPoint(x: mountain2.size.width + scrollLayerMediumFast.convert(mountain1.position, to: self).x, y: mountainPosition.y)
            /* Convert new node position back to scroll layer space */
            mountain2.position = self.convert(newPosition, to: scrollLayerMediumFast)
        }
        /*scrollLayerMedium.position.x -= cactusScrollSpeed * CGFloat(1.0 / 60.0)
        let cactus1 = scrollLayerMedium.children[0] as! SKSpriteNode
        let cactus2 = scrollLayerMedium.children[1] as! SKSpriteNode
        /* Get ground node position, convert node position to scene space */
        var cactusPosition = scrollLayerMedium.convert(cactus1.position, to: self)
        /* Check if ground sprite has left the scene */
        if cactusPosition.x <= -ground1.size.width * 1.5 {
            /* Reposition ground sprite to the second starting position */
            let newPosition = CGPoint(x: ground1.size.width * 0.5, y: cactusPosition.y)
            /* Convert new node position back to scroll layer space */
            cactus1.position = self.convert(newPosition, to: scrollLayerMedium)
        }
        cactusPosition = scrollLayerMedium.convert(cactus2.position, to: self)
        /* Check if ground sprite has left the scene */
        if cactusPosition.x <= -ground2.size.width * 1.5 {
            /* Reposition ground sprite to the second starting position */
            let newPosition = CGPoint(x: ground2.size.width * 0.5, y: cactusPosition.y)
            /* Convert new node position back to scroll layer space */
            cactus2.position = self.convert(newPosition, to: scrollLayerMedium)
        }*/
        scrollLayerSlow.position.x -= cloudScrollSpeed * CGFloat(1.0 / 60.0)
        let cloud1 = scrollLayerSlow.children[0] as! SKSpriteNode
        let cloud2 = scrollLayerSlow.children[1] as! SKSpriteNode
        /* Get ground node position, convert node position to scene space */
        var cloudPosition = scrollLayerSlow.convert(cloud1.position, to: self)
        /* Check if ground sprite has left the scene */
        if cloudPosition.x <= -ground1.size.width * 1.5 {
            /* Reposition ground sprite to the second starting position */
            let newPosition = CGPoint(x: ground1.size.width * 0.65, y: cloudPosition.y)
            /* Convert new node position back to scroll layer space */
            cloud1.position = self.convert(newPosition, to: scrollLayerSlow)
        }
        cloudPosition = scrollLayerSlow.convert(cloud2.position, to: self)
        /* Check if ground sprite has left the scene */
        if cloudPosition.x <= -ground2.size.width * 1.5 {
            /* Reposition ground sprite to the second starting position */
            let newPosition = CGPoint(x: ground2.size.width * 0.65, y: cloudPosition.y)
            /* Convert new node position back to scroll layer space */
            cloud2.position = self.convert(newPosition, to: scrollLayerSlow)
        }
    }
}
