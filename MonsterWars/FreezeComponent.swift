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

class FreezeComponent: GKComponent {
    
    let power: CGFloat
    let freezeRate: CGFloat
    var lastFreezeTime: CFTimeInterval = 0
    let destroySelf: Bool
    let sound: SKAction
    let entityManager: EntityManager
    
    init(power: CGFloat,freezeRate: CGFloat, destroySelf: Bool, sound: SKAction, entityManager: EntityManager) {
        self.power = power
        self.freezeRate = freezeRate
        self.destroySelf = destroySelf
        self.sound = sound
        self.entityManager = entityManager
        super.init()
    }
    
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
                
                // Check freeze rate
                if (CGFloat(CACurrentMediaTime() - lastFreezeTime) > freezeRate) {
                    
                    spriteComponent.node.parent?.runAction(sound)
                    lastFreezeTime = CACurrentMediaTime()
                    
                    
                    // Freeze
                    enemyEntity.componentForClass(MoveComponent)?.stop(Int(power))
                    enemyEntity.componentForClass(MeleeComponent)?.stop(Int(power))
                    enemyEntity.componentForClass(FiringComponent)?.stop(Int(power))
                    enemyEntity.componentForClass(SpriteComponent)?.node.removeAllActions()
                    
                    // Destroy self
                    if destroySelf {
                        entityManager.remove(entity!)
                    }
                }
            }
        }
        
        
    }
    
}