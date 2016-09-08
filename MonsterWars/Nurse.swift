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

class Nurse: GKEntity {
    
    init(team: Team, entityManager: EntityManager) {
        
        super.init()
        
        var texture = SKTexture(imageNamed: "quirk1")

        
        
        if team == Team.Team1 {
            texture = SKTexture(imageNamed: "quirk1")
        }
        if team == Team.Team2 {
            texture = SKTexture(imageNamed: "munch1")}

        
        let spriteComponent = SpriteComponent(entity: self, texture: texture, size: texture.size())
        addComponent(spriteComponent)
        addComponent(HealthComponent(parentNode: spriteComponent.node, barWidth: texture.size().width, barOffset: texture.size().height/2, health: 50, entityManager: entityManager))
        addComponent(MoveComponent(maxSpeed: 75, maxAcceleration: 2, radius: Float(texture.size().width / 2), entityManager: entityManager))
        addComponent(TeamComponent(team: team))
        addComponent(HealingComponent(range: 50, healrate: 1.7, healamt: 0.5, sound: SoundManager.sharedInstance.soundPew, entityManager: entityManager))
    }
}
