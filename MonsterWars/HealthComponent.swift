//
//  HealthComponent.swift
//  DinoDefense
//
//  Created by Toby Stephens on 20/10/2015.
//  Copyright © 2015 razeware. All rights reserved.
//

import SpriteKit
import GameplayKit

class HealthComponent: GKComponent {
  
  let fullHealth: CGFloat
  var health: CGFloat
  let healthBarFullWidth: CGFloat
  let healthBar: SKShapeNode
  let entityManager: EntityManager
    var ratio: CGFloat
  
  let soundAction = SKAction.playSoundFileNamed("smallHit.wav", waitForCompletion: false)
  
  init(parentNode: SKNode, barWidth: CGFloat,
    barOffset: CGFloat, health: CGFloat, entityManager: EntityManager) {
      
      self.fullHealth = health
      self.health = health
      self.entityManager = entityManager
      self.ratio = health/fullHealth
      healthBarFullWidth = barWidth
      healthBar = SKShapeNode(rectOfSize:
        CGSizeMake(healthBarFullWidth, 5), cornerRadius: 1)
      healthBar.fillColor = UIColor.greenColor()
      healthBar.strokeColor = UIColor.greenColor()
      healthBar.position = CGPointMake(0, barOffset)
      parentNode.addChild(healthBar)
      
      healthBar.hidden = true
  }
    var action: SKAction!
  func takeDamage(damage: CGFloat) -> Bool {
    health = max(health - damage, 0)
    ratio = health/fullHealth
    
    action = SKAction.scaleBy(1, duration: 1000)
    let dotEmitter = SKEmitterNode(fileNamed: "damage.sks")
    dotEmitter?.particleZPosition = -1
    self.entity?.componentForClass(SpriteComponent)?.node.addChild(dotEmitter!)
    self.entity?.componentForClass(SpriteComponent)?.node.runAction(SKAction.sequence([action]))
    dotEmitter?.removeFromParent()
    
    
    
    
    
    healthBar.hidden = false
    let healthScale = health/fullHealth
    let scaleAction = SKAction.scaleXTo(healthScale, duration: 0.5)
    healthBar.runAction(SKAction.group([soundAction, scaleAction]))
    
    if health == 0 {
      if let entity = entity {
        // Never remove the castle
        let castleComponent = entity.componentForClass(CastleComponent.self)
        if castleComponent == nil {
          entityManager.remove(entity)
        }
      }
    }
    
    return health == 0
  }
  
    
    func recoverHealth(amt: CGFloat) {
        health = min(fullHealth, health + amt)
        ratio = health/fullHealth
        
        healthBar.hidden = false
        let healthScale = health/fullHealth
        let scaleAction = SKAction.scaleXTo(healthScale, duration: 0.5)
        healthBar.runAction(SKAction.group([soundAction, scaleAction]))
    }

}


