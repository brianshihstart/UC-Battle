//
//  FiringComponent.swift
//  MonsterWars
//
//  Created by Main Account on 11/3/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class FiringComponent: GKComponent {
  
  var timer = 0;
  let range: CGFloat
  let damage: CGFloat
  let damageRate: CGFloat
  var lastDamageTime: NSTimeInterval
  let sound: SKAction
  let entityManager: EntityManager
    let firingType: String
  
    init(range: CGFloat, damage: CGFloat, damageRate: CGFloat, sound: SKAction, entityManager: EntityManager, firingType: String) {
        
    self.firingType = firingType
    self.range = range
    self.damage = damage
    self.damageRate = damageRate
    self.sound = sound
    self.lastDamageTime = 0
    self.entityManager = entityManager
    super.init()
  }
    
    func stop(time: Int){
        timer += time
    }
  
  override func updateWithDeltaTime(seconds: NSTimeInterval) {
    if (timer == 0){
    super.updateWithDeltaTime(seconds)
    
    // Get required components
    guard let teamComponent = entity?.componentForClass(TeamComponent.self),
              spriteComponent = entity?.componentForClass(SpriteComponent.self) else {
      return
    }
    
    
    if firingType == "laser"  {
    // Loop through enemy entities
    let enemyEntities = entityManager.entitiesForTeam(teamComponent.team.oppositeTeam())
    for enemyEntity in enemyEntities {
      
      // Get required components
      guard let enemySpriteComponent = enemyEntity.componentForClass(SpriteComponent.self) else {
        continue
      }
      
      let distance = (spriteComponent.node.position - enemySpriteComponent.node.position).length()
      let wiggleRoom = CGFloat(5)
      
        
        
        if (CGFloat(abs(distance)) <= range + wiggleRoom && CGFloat(CACurrentMediaTime() - lastDamageTime) > damageRate) {
      
        spriteComponent.node.parent?.runAction(sound)
        lastDamageTime = CACurrentMediaTime()
        
        let laser = Laser(team: teamComponent.team, damage: damage, entityManager: entityManager)
        guard let laserSpriteComponent = laser.componentForClass(SpriteComponent.self) else {
          continue
        }
        
        laserSpriteComponent.node.position = spriteComponent.node.position
        let direction = (enemySpriteComponent.node.position - spriteComponent.node.position).normalized()
        let laserPointsPerSecond = CGFloat(300)
        let laserDistance = CGFloat(1000)
        
        let target = direction * laserDistance
        let duration = laserDistance / laserPointsPerSecond
        
        laserSpriteComponent.node.zRotation = direction.angle
        laserSpriteComponent.node.zPosition = 1
        
        laserSpriteComponent.node.runAction(SKAction.sequence([
          SKAction.moveByX(target.x, y: target.y, duration: NSTimeInterval(duration)),
          SKAction.runBlock() {
            self.entityManager.remove(laser)
          }
        ]))
        
        entityManager.add(laser)
      
      }
      
    }
    }
    
    
    if firingType == "bomb"  {
        // Loop through enemy entities
        let enemyEntities = entityManager.entitiesForTeam(teamComponent.team.oppositeTeam())
        for enemyEntity in enemyEntities {
            
            // Get required components
            guard let enemySpriteComponent = enemyEntity.componentForClass(SpriteComponent.self) else {
                continue
            }
            
            let distance = (spriteComponent.node.position - enemySpriteComponent.node.position).length()
            let wiggleRoom = CGFloat(5)
            
            
            
            if (CGFloat(abs(distance)) <= range + wiggleRoom && CGFloat(CACurrentMediaTime() - lastDamageTime) > damageRate) {
                
                spriteComponent.node.parent?.runAction(sound)
                lastDamageTime = CACurrentMediaTime()
                
                let bomb = Bomb(team: teamComponent.team, damage: damage, entityManager: entityManager)
                guard let bombSpriteComponent = bomb.componentForClass(SpriteComponent.self) else {
                    continue
                }
                
                bombSpriteComponent.node.position = spriteComponent.node.position
                let direction = (enemySpriteComponent.node.position - spriteComponent.node.position).normalized()
                let bombPointsPerSecond = CGFloat(300)
                let bombDistance = CGFloat(1000)
                
                let target = direction * bombDistance
                let duration = bombDistance / bombPointsPerSecond
                
                bombSpriteComponent.node.zRotation = direction.angle
                bombSpriteComponent.node.zPosition = 1
                
                bombSpriteComponent.node.runAction(SKAction.sequence([
                    SKAction.moveByX(target.x, y: target.y, duration: NSTimeInterval(duration)),
                    SKAction.runBlock() {
                        self.entityManager.remove(bomb)
                    }
                    ]))
                
                entityManager.add(bomb)
                
            }
            
        }
    }
        if firingType == "freeze"  {
            // Loop through enemy entities
            let enemyEntities = entityManager.entitiesForTeam(teamComponent.team.oppositeTeam())
            for enemyEntity in enemyEntities {
                
                // Get required components
                guard let enemySpriteComponent = enemyEntity.componentForClass(SpriteComponent.self) else {
                    continue
                }
                
                let distance = (spriteComponent.node.position - enemySpriteComponent.node.position).length()
                let wiggleRoom = CGFloat(5)
                
                
                
                if (CGFloat(abs(distance)) <= range + wiggleRoom && CGFloat(CACurrentMediaTime() - lastDamageTime) > damageRate) {
                    
                    spriteComponent.node.parent?.runAction(sound)
                    lastDamageTime = CACurrentMediaTime()
                    
                    let ice = Ice(team: teamComponent.team, entityManager: entityManager)
                    guard let iceSpriteComponent = ice.componentForClass(SpriteComponent.self) else {
                        continue
                    }
                    
                    iceSpriteComponent.node.position = spriteComponent.node.position
                    let direction = (enemySpriteComponent.node.position - spriteComponent.node.position).normalized()
                    let icePointsPerSecond = CGFloat(300)
                    let iceDistance = CGFloat(1000)
                    
                    let target = direction * iceDistance
                    let duration = iceDistance / icePointsPerSecond
                    
                    iceSpriteComponent.node.zRotation = direction.angle
                    iceSpriteComponent.node.zPosition = 1
                    
                    iceSpriteComponent.node.runAction(SKAction.sequence([
                        SKAction.moveByX(target.x, y: target.y, duration: NSTimeInterval(duration)),
                        SKAction.runBlock() {
                            self.entityManager.remove(ice)
                        }
                        ]))
                    
                    entityManager.add(ice)
                    
                }
                
            }
        }
        
        
    }
    else{
        timer -= 1
    }
    }

    
  }
    
  
