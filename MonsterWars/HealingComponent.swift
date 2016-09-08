//
//  File.swift
//  MonsterWars
//
//  Created by Hao Nguyen on 4/30/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class HealingComponent: GKComponent {
    
    let range: CGFloat
    let healRate: CGFloat
    let healamt: CGFloat
    var lastHealTime: NSTimeInterval
    let sound: SKAction
    let entityManager: EntityManager
    var healths = [HealthComponent]()
    var important = [GKEntity]()
    var CX, CY: CGFloat
    var HX, HY: CGFloat
    var healing: Bool
    var numIm: Int
    var pos: CGPoint
    
    init(range: CGFloat, healrate: CGFloat, healamt: CGFloat, sound: SKAction, entityManager: EntityManager) {
        self.range = range
        self.healRate =  healrate
        self.healamt = healamt
        self.sound = sound
        self.lastHealTime = 0
        self.entityManager = entityManager
        self.CX = 0
        self.CY = 0
        self.HX = 0
        self.HY = 0
        self.healing = false
        self.numIm = 3
        self.pos = CGPointMake(0.0, 0.0)
        super.init()
    }
    
    func sortFunc(num1: HealthComponent, num2: HealthComponent) -> Bool {
        return num1.ratio < num2.ratio
    }
    
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        CX = 0
        CY = 0
        healths.removeAll()
        important.removeAll()
        super.updateWithDeltaTime(seconds)
        
        // Get required components
        guard let teamComponent = entity?.componentForClass(TeamComponent.self),
            spriteComponent = entity?.componentForClass(SpriteComponent.self) else {
                return
        }
        
        // Loop through entities
        let friendlyEntities = entityManager.entitiesForTeam(teamComponent.team)
        
        for index in friendlyEntities
        {
            if ((index).componentForClass(CastleComponent) == nil && (index).componentForClass(HealthComponent) != nil && (index) != self)
            {
                let current = (index).componentForClass(HealthComponent)
                healths.append(current!)
                
            }
        }
        
        healths.sortInPlace(sortFunc)
        
        // get center of mass
        for var index = 0; index < numIm && index < healths.count; index++
        {
            let current = healths[index].entity;
            important.append(current!)
            let thisX = current!.componentForClass(SpriteComponent)!.node.position.x
            let thisY = current!.componentForClass(SpriteComponent)!.node.position.y
            CX += thisX
            CY += thisY
        }
        
        CX = CX/CGFloat(important.count)
        CY = CY/CGFloat(important.count)
        pos = CGPointMake(CX, CY)
        
        for index in important {
            
            HX = spriteComponent.node.position.x
            HY = spriteComponent.node.position.y
            let thisX = index.componentForClass(SpriteComponent)!.node.position.x
            let thisY = index.componentForClass(SpriteComponent)!.node.position.y
            
            if ((thisX-HX)*(thisX-HX)+(thisY-HY)*(thisY-HY) < (thisX-CX)*(thisX-CX)+(thisY-CY)*(thisY-CY) + (HX-CX)*(HX-CX)+(CX-CY)*(CX-CY))
            {
                healing = true;
            }
            
            if (healing == true && CGFloat(CACurrentMediaTime() - lastHealTime) > healRate && (index).componentForClass(HealthComponent)!.ratio < 0.99)
            {
                lastHealTime = CACurrentMediaTime()
                (index).componentForClass(HealthComponent)?.recoverHealth(healamt*((index).componentForClass(HealthComponent)?.fullHealth)!)
                
                let dotEmitter = SKEmitterNode(fileNamed: "ParticleEffectPlayerCollide.sks")
                dotEmitter?.particleZPosition = -1
                
                (index).componentForClass(SpriteComponent)!.node.addChild(dotEmitter!)
            }
            
            
        }
        
        
    }
    
}