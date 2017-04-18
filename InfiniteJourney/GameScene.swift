//
//  GameScene.swift
//  InfiniteJourney
//
//  Created by ADB on 1/31/17.
//  Copyright © 2017 ADB. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let groundScrollSpeed: CGFloat = 900
    let mountainScrollSpeed: CGFloat = 300
    let cactusScrollSpeed: CGFloat = 450
    let cloudScrollSpeed: CGFloat = 100
    let staticDelta: TimeInterval = 1.0/60.0
    var scrollLayerFast: SKNode!
    var scrollLayerMediumFast: SKNode!
    var scrollLayerMedium: SKNode!
    var scrollLayerSlow: SKNode!
    var scoreLabel: SKLabelNode!
    var cowboy: Cowboy!
    var cowboyYPosition: CGFloat!
    var animationStartTime: TimeInterval = 0.0
    var meterStartTime: TimeInterval = Date().timeIntervalSinceReferenceDate
    var animationCounter: Int = 0
    var points = 0
    var wind: SKSpriteNode!
    var shop: MSButtonNode!
    var blurBackground: SKSpriteNode!
    var shopScreen: SKSpriteNode!
    var backToGame: MSButtonNode!
    var energyButton: MSButtonNode!
    var speedButton: MSButtonNode!
    var hotdogButton: MSButtonNode!
    var isGamePaused = false
    
    override func didMove(to view: SKView) {

        scrollLayerFast = self.childNode(withName: "scrollLayerFast")
        scrollLayerMediumFast = self.childNode(withName: "scrollLayerMediumFast")
        scrollLayerMedium = self.childNode(withName: "scrollLayerMedium")
        scrollLayerSlow = self.childNode(withName: "scrollLayerSlow")
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        cowboy = self.childNode(withName: "cowboy") as! Cowboy
        wind = self.childNode(withName: "Wind") as! SKSpriteNode
        shop = self.childNode(withName: "shop") as! MSButtonNode
        blurBackground = self.childNode(withName: "blurBackground") as! SKSpriteNode
        shopScreen = self.childNode(withName:"shopScreen") as! SKSpriteNode
        backToGame = self.childNode(withName: "backToGame") as! MSButtonNode
        cowboyYPosition = CGFloat(cowboy.position.y)
        scoreLabel.text = String(points) + " m"
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedRight(_:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedLeft(_:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedUp(_:)))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedDown(_:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        shop.selectedHandler = { [unowned self] in
            self.isGamePaused = true
            self.shopScreen.run(SKAction(named: "slideDown")!)
            self.blurBackground.position = CGPoint(x: 0, y:0)
            self.backToGame.run(SKAction(named: "backButtonDown")!)
        }
        
        backToGame.selectedHandler = {
            self.isGamePaused = false
            self.shopScreen.run(SKAction(named: "slideUp")!)
            self.blurBackground.position = CGPoint(x: 1000, y: 0)
            self.backToGame.run(SKAction(named: "backButtonUp")!)
        }
    }
    
    func scrollWorld()  {
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
            ground2                                                                                                                         .position = self.convert(newPosition, to: scrollLayerFast)
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
            mountain2                                                                                                                         .position = self.convert(newPosition, to: scrollLayerMediumFast)
        }
        
        scrollLayerMedium.position.x -= cactusScrollSpeed * CGFloat(1.0 / 60.0)
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
            cactus2                                                                                                                        .position = self.convert(newPosition, to: scrollLayerMedium)
        }
        
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
            cloud2                                                                                                                        .position = self.convert(newPosition, to: scrollLayerSlow)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if (!isGamePaused)  {
            let n = self.childNode(withName: "Wind")!.copy() as! SKSpriteNode
            n.position = pos
            n.run(SKAction.sequence([SKAction(named: "Wind")!, SKAction.removeFromParent()]))
            n.zPosition = 3
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    func swipedRight(_ gesture: UIGestureRecognizer) {
        points += cowboy.clickPoint
        animationCounter = 0
        animationStartTime = Date().timeIntervalSinceReferenceDate
        
        if (cowboy.characterState != .Running) {
            cowboy.removeAction(forKey: "Idle")
            cowboy.run(SKAction(named: "Run")!)
            cowboy.characterState = .Running
        }
    }
    
    func swipedLeft(_ gesture: UIGestureRecognizer) {
        print("swiped left")
    }
    
    func swipedUp(_ gesture: UIGestureRecognizer) {
        animationCounter = 0
        animationStartTime = Date().timeIntervalSinceReferenceDate
        if (cowboy.characterState != .Jumping) {
            cowboy.removeAction(forKey: "Idle")
            cowboy.run(SKAction(named: "Jump")!)
            cowboy.characterState = .Jumping
        }
    }
    
    func swipedDown(_ gesture: UIGestureRecognizer) {
        animationCounter = 0
        animationStartTime = Date().timeIntervalSinceReferenceDate
        if (cowboy.characterState != .Sliding) {
            cowboy.removeAction(forKey: "Idle")
            cowboy.run(SKAction(named: "Slide")!)
            cowboy.characterState = .Sliding
        }
    }
    func shopButtonPressed() {
        let effectsNode = SKEffectNode()
        let filter = CIFilter(name: "CIGaussianBlur")
        // Set the blur amount. Adjust this to achieve the desired effect
        let blurAmount = 10.0
        filter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
        
        effectsNode.filter = filter
        effectsNode.position = self.view!.center
        effectsNode.blendMode = .alpha
        self.addChild(scrollLayerFast)
        self.addChild(scrollLayerSlow)
        self.addChild(scrollLayerMedium)
        self.addChild(scrollLayerMediumFast)
        self.addChild(scoreLabel)
        self.addChild(cowboy)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches    {
            self.touchDown(atPoint: t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (!isGamePaused)    {
        
        // Update score label
        scoreLabel.text = String(points) + " m"
        
        // Assign current speed
        switch cowboy.characterState    {
        case .Idle:
            cowboy.currentSpeed = cowboy.idleSpeed
        case .Running:
            cowboy.currentSpeed = cowboy.runningSpeed
        case .Sliding:
            cowboy.currentSpeed = cowboy.slidingSpeed
        case .Jumping:
            cowboy.currentSpeed = cowboy.jumpingSpeed

        }
        
        let currentTime = Date().timeIntervalSinceReferenceDate
        
        if (cowboy.characterState == .Running) {
            cowboy.position.y = cowboyYPosition! - 15.0
        }
        // Check if meter needs to be added
        if (currentTime - meterStartTime >= 1.0 / Double(cowboy.currentSpeed))  {
            points += Int(floor((currentTime - meterStartTime) * Double(cowboy.currentSpeed)))
            meterStartTime = currentTime
        }
        // Check if animation needs to be removed
        if (currentTime - animationStartTime >= 1.0) {
            animationCounter += 1
            cowboy.position.y = cowboyYPosition
            if (animationCounter == 1)  {
                cowboy.characterState = .Idle
                switch cowboy.characterState    {
                case .Running:
                    cowboy.removeAction(forKey: "Run")
                    cowboy.run(SKAction(named: "Idle")!)
                case .Sliding:
                    cowboy.removeAction(forKey: "Slide")
                    cowboy.run(SKAction(named: "Idle")!)
                case .Jumping:
                    cowboy.removeAction(forKey: "Jump")
                    cowboy.run(SKAction(named: "Idle")!)
                default:
                    cowboy.run(SKAction(named: "Idle")!)
                }
            }
        }   else    {
            cowboy.position.y = cowboyYPosition! - 15.0
        }
        scrollWorld()
        // Called before each frame is rendered
        }
    }
}
