//
//  Intro.swift
//  MonsterWars
//
//  Created by Warren on 4/30/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import Foundation

//
//  introScene.swift
//  MonsterWars
//
//  Created by Brian Shih on 4/30/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//


//
//  introScene.swift
//  MonsterWars
//
//  Created by Brian Shih on 4/29/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit

class IntroScene: SKScene
{
   // let fireEmmiterLeft = SKEmitterNode(fileNamed: "fire.sks")
    
    let fireEmitterRight: SKEmitterNode
    let fireEmitterLeft: SKEmitterNode

    let ucBattle: SKSpriteNode
    let realBackGround: SKSpriteNode
    let pressTostart: SKSpriteNode
    
    init(size:CGSize, playbutton:String, background:String)
    {
        ucBattle = SKSpriteNode(imageNamed: "ucBattle")
        realBackGround = SKSpriteNode(imageNamed: "realBackground")
        pressTostart = SKSpriteNode(imageNamed: "pressToStart")
        fireEmitterRight = SKEmitterNode(fileNamed: "fire.sks")!
        fireEmitterLeft = SKEmitterNode(fileNamed: "fire.sks")!
        
        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // role is to add background and play button
    func addChildToScene() {
        
       
        
        ucBattle.zPosition = 5000
        ucBattle.position = CGPointMake(self.size.width/2, self.size.height/2)
        var ucScaleX = 0.15 * self.size.width/ucBattle.size.width
        var ucScaleY = 0.15 * self.size.height/ucBattle.size.height
        ucBattle.xScale = ucScaleX
        ucBattle.yScale = ucScaleY
        ucBattle.name = "ucBattle"
        addChild(ucBattle)
                
        realBackGround.zPosition = 0
        realBackGround.size = CGSize(width:self.size.width, height:self.size.height)
        realBackGround.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        addChild(realBackGround)
        
        
        

    }
    
    func boomThenFire() {
        ucBattle.runAction(ucBattleAnimation)
        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(IntroScene.addFireAndPress), userInfo: nil, repeats: false);
        
    }
    
   var ucBattleAnimation = SKAction()
   var pressToStartAnimation = SKAction()
    func createAnimations() {
        ucBattleAnimation = SKAction.sequence([SKAction.waitForDuration(0.3), SKAction.scaleBy(6, duration: 0.2)])
        let sequence = SKAction.sequence([SKAction.fadeInWithDuration(0.6), SKAction.fadeOutWithDuration(0.6)])
        pressToStartAnimation = SKAction.repeatActionForever(sequence)

    }

    
    override func didMoveToView(view: SKView)
    {   createAnimations()
        addChildToScene()
        boomThenFire()
    }

    
    func addFireAndPress() {
        
//               done = true
        fireEmitterRight.position = CGPointMake(self.frame.size.height/2.2, self.frame.size.height/2.85)
        fireEmitterRight.hidden = false
        fireEmitterRight.zPosition = 1000
        print(fireEmitterRight.emissionAngle)
        addChild(fireEmitterRight)
        
        fireEmitterLeft.position = CGPointMake(self.frame.size.width/1.35, self.frame.size.height/2.85)
        fireEmitterLeft.emissionAngle = 0
        fireEmitterLeft.hidden = false
        fireEmitterLeft.zPosition = 1000
        addChild(fireEmitterLeft)
        
        pressTostart.zPosition = 50000
        pressTostart.position = CGPointMake(self.size.width/2, self.size.height/6.34)
        let pressScaleX = 0.89 * self.size.width/pressTostart.size.width
        let pressScaleY = 0.89 * self.size.height/pressTostart.size.height
        pressTostart.xScale = pressScaleX
        pressTostart.yScale = pressScaleY
        pressTostart.name = "pressToStart"
        addChild(pressTostart)
        pressTostart.runAction(pressToStartAnimation)
        
//        self.timeOfLastMove = currentTime


    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        for touch: AnyObject in touches
        {
            let location = touch.locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            
            if node.name == pressTostart.name {
                goToNextScene()
            }
        }
    }
    
    
    
    
    
    func goToNextScene() {
        
        let transitionEffect = SKTransition.fadeWithDuration(1.0)
        
        let player1menu = MenuScene(size: CGSize(width:self.size.width, height:self.size.height), nextButton: "nextButton", background: "background")
        
        self.view?.presentScene(player1menu)
        
        
    }
    
    
}
