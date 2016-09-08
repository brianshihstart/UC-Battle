//
//  Munch.swift
//  MonsterWars
//
//  Created by Main Account on 11/3/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Munch: GKEntity {
  
  init(team: Team, entityManager: EntityManager, imageName: String) {
    
    super.init()
    
    let texture = SKTexture(imageNamed: imageName)
    let spriteComponent = SpriteComponent(entity: self, texture: texture, size: texture.size())
    addComponent(spriteComponent)
    addComponent(HealthComponent(parentNode: spriteComponent.node, barWidth: texture.size().width, barOffset: texture.size().height/2, health: 250, entityManager: entityManager))
    addComponent(moneyMove(maxSpeed: 10, maxAcceleration: 1, radius: Float(texture.size().width * 0.3), entityManager: entityManager))
    addComponent(TeamComponent(team: team))
    addComponent(MeleeComponent(damage: 15, destroySelf: false, damageRate: 3, aoe: true, sound: SoundManager.sharedInstance.soundBigHit, entityManager: entityManager))
    
  }

}