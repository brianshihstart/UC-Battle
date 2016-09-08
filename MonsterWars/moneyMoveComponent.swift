//
//  SpriteAgent.swift
//  MonsterWars
//
//  Created by Main Account on 11/3/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class moneyMove : GKAgent2D, GKAgentDelegate {
    
    let entityManager: EntityManager
    
    init(maxSpeed: Float, maxAcceleration: Float, radius: Float, entityManager: EntityManager) {
        self.entityManager = entityManager
        super.init()
        delegate = self
        self.maxSpeed = maxSpeed
        self.maxAcceleration = maxAcceleration
        self.radius = radius
        print(self.mass)
        self.mass = 0.01
    }
    
    func agentWillUpdate(agent: GKAgent) {
        guard let spriteComponent = entity?.componentForClass(SpriteComponent.self) else {
            return
        }
        
        position = float2(spriteComponent.node.position)
    }
    
    func agentDidUpdate(agent: GKAgent) {
        guard let spriteComponent = entity?.componentForClass(SpriteComponent.self) else {
            return
        }
        
        spriteComponent.node.position = CGPoint(position)
    }
    
//    func closestMoveComponentForTeam(team: Team) -> GKAgent2D? {
//        
//        var closestMoveComponent: MoveComponent? = nil
//        var closestDistance = CGFloat(0)
//        
//        let enemyMoveComponents = entityManager.moveComponentsForTeam(team)
//        for enemyMoveComponent in enemyMoveComponents {
//            let distance = (CGPoint(enemyMoveComponent.position) - CGPoint(position)).length()
//            if closestMoveComponent == nil || distance < closestDistance {
//                closestMoveComponent = enemyMoveComponent
//                closestDistance = distance
//            }
//        }
//        return closestMoveComponent
//        
//    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        
        super.updateWithDeltaTime(seconds)
        
        // Determine team
        guard let entity = entity,
            let teamComponent = entity.componentForClass(TeamComponent.self) else {
                return
        }
        
        // Find team castle
        guard let team = entityManager.castleForTeam(teamComponent.team),
            let teamCastleComponent = team.componentForClass(CastleComponent.self),
            let teamMoveComponent = team.componentForClass(MoveComponent.self) else {
                return
        }
        
        var targetMoveComponent: GKAgent2D
        
        targetMoveComponent = teamMoveComponent
        
        
        // Find allies
        let alliedMoveComponents = entityManager.moveComponentsForTeam(teamComponent.team)
        
        // Reset behavior
        behavior = moneyBagBehavior(targetSpeed: maxSpeed, seek: targetMoveComponent)
        
    }
    
}