//
//  Bomb.swift
//  UC Battle
//
//  Created by Brian Shih on 5/22/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Bomb: GKEntity {
    
    init(team: Team, damage: CGFloat, entityManager: EntityManager) {
        
        super.init()
        
        let texture = SKTexture(imageNamed: "bomb\(team.rawValue)")
        let spriteComponent = SpriteComponent(entity: self, texture: texture, size: texture.size())
        addComponent(spriteComponent)
        addComponent(TeamComponent(team: team))
        addComponent(BombComponent(damage: damage, destroySelf: true, damageRate: 1.0, aoe: false, sound: SoundManager.sharedInstance.soundSmallHit, entityManager: entityManager))

    }
    
    
}