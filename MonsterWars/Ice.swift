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

class Ice: GKEntity {
    
    init(team: Team, entityManager: EntityManager) {
        
        super.init()
        
        let texture = SKTexture(imageNamed: "ice\(team.rawValue)")
        let spriteComponent = SpriteComponent(entity: self, texture: texture, size: texture.size())
        addComponent(spriteComponent)
        addComponent(TeamComponent(team: team))
        addComponent(FreezeComponent(power:1000,freezeRate: 1.5, destroySelf: true, sound: SoundManager.sharedInstance.soundSmallHit, entityManager: entityManager))
    }
    
    
}