//
//  Mage.swift
//  UC Battle
//
//  Created by Hao Nguyen on 5/28/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Mage: GKEntity {
    
    init(team: Team, entityManager: EntityManager, imageName: String) {
        
        super.init()
        
        let texture = SKTexture(imageNamed: imageName)
        let spriteComponent = SpriteComponent(entity: self, texture: texture, size: texture.size())
        addComponent(spriteComponent)
        addComponent(HealthComponent(parentNode: spriteComponent.node, barWidth: texture.size().width, barOffset: texture.size().height/2, health: 25, entityManager: entityManager))
        addComponent(MoveComponent(maxSpeed: 50, maxAcceleration: 1, radius: Float(texture.size().width / 2), entityManager: entityManager))
        addComponent(TeamComponent(team: team))
        addComponent(FiringComponent(range: 300, damage: 35, damageRate: 1.5, sound: SoundManager.sharedInstance.soundPew, entityManager: entityManager, firingType: "freeze"))
        
    }
    
}