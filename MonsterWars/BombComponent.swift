//
//  MeleeComponent.swift
//  MonsterWars
//
//  Created by Main Account on 11/3/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class BombComponent: GKComponent {
    
    let damage: CGFloat
    let destroySelf: Bool
    let damageRate: CGFloat
    var lastDamageTime: NSTimeInterval
    let aoe: Bool
    let sound: SKAction
    let entityManager: EntityManager
    
    var circle = SKShapeNode(circleOfRadius: 500)
    
    
    func distance(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let distanceX = point1.x - point2.x
        let distanceY = point1.y - point2.y

        
        return sqrt(distanceX*distanceX + distanceY*distanceY)
    }
    
    
    
    
    
    init(damage: CGFloat, destroySelf: Bool, damageRate: CGFloat, aoe: Bool, sound: SKAction, entityManager: EntityManager) {
        self.damage = damage
        self.destroySelf = destroySelf
        self.damageRate = damageRate
        self.aoe = aoe
        self.sound = sound
        self.lastDamageTime = 0
        self.entityManager = entityManager
        super.init()
    }
    
    var explosionPoint: CGPoint!
    var contact = false
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        
        super.updateWithDeltaTime(seconds)
        
        // Get required components
        guard let teamComponent = entity?.componentForClass(TeamComponent.self),
            spriteComponent = entity?.componentForClass(SpriteComponent.self) else {
                return
        }
        
        // Loop through enemy entities
        let enemyEntities = entityManager.entitiesForTeam(teamComponent.team.oppositeTeam())
        for enemyEntity in enemyEntities {
            
            // Get required components
            guard let enemySpriteComponent = enemyEntity.componentForClass(SpriteComponent.self),
                let enemyHealthComponent = enemyEntity.componentForClass(HealthComponent.self) else {
                    continue
            }
            
            // Check for intersection
            if (CGRectIntersectsRect(spriteComponent.node.calculateAccumulatedFrame(), enemySpriteComponent.node.calculateAccumulatedFrame())) {
                
                
                explosionPoint = spriteComponent.node.position
                contact = true
                
            }
        }
        // end for loop
        if contact == true {
        for enemy in enemyEntities {
            
            guard let enemySpriteComponent = enemy.componentForClass(SpriteComponent.self),
                let enemyHealthComponent = enemy.componentForClass(HealthComponent.self) else {
                    continue
            }
         
            if distance(explosionPoint, point2: enemySpriteComponent.node.position) <= 500 && (enemy).componentForClass(CastleComponent) == nil {
                
                
                
                enemyHealthComponent.takeDamage(1000)
                entityManager.remove(entity!)
                print(explosionPoint)
                
            }
            
            
            
        }
            contact = false
        }
        
    }
    
}