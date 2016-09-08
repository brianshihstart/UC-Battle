//
//  EntityManager.swift
//  MonsterWars
//
//  Created by Main Account on 11/3/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {

  var entities = Set<GKEntity>()
  var toRemove = Set<GKEntity>()
  let scene: SKScene
    var p1string: String
    var p2string: String
    
    let player1Side = "1"
    let player2Side = "2"
    
    //p1string + playerside + thing
  
  lazy var componentSystems: [GKComponentSystem] = {
    let moveSystem = GKComponentSystem(componentClass: MoveComponent.self)
    let meleeSystem = GKComponentSystem(componentClass: MeleeComponent.self)
    let firingSystem = GKComponentSystem(componentClass: FiringComponent.self)
    let castleSystem = GKComponentSystem(componentClass: CastleComponent.self)
    let healingSystem = GKComponentSystem(componentClass: HealingComponent.self)
    let bombSystem = GKComponentSystem(componentClass: BombComponent.self)
    let freezeSystem = GKComponentSystem(componentClass: FreezeComponent.self)
    
    return [moveSystem, meleeSystem, firingSystem, castleSystem, healingSystem, bombSystem, freezeSystem]
  }()
  
    init(scene: SKScene, player1schoolString: String, player2schoolString: String) {
    self.scene = scene
        p1string = player1schoolString
        p2string = player2schoolString
  }
  
  func add(entity: GKEntity) {
    entities.insert(entity)
    
    for componentSystem in componentSystems {
      componentSystem.addComponentWithEntity(entity)
    }
  
    if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
      scene.addChild(spriteNode)
    }
  
  }
  
  func remove(entity: GKEntity) {
  
    if let spriteNode = entity.componentForClass(SpriteComponent.self)?.node {
      spriteNode.removeFromParent()
    }
    
    toRemove.insert(entity)
    entities.remove(entity)
  }
  
  func entitiesForTeam(team: Team) -> [GKEntity] {
    
    return entities.flatMap{ entity in
      if let teamComponent = entity.componentForClass(TeamComponent.self) {
        if teamComponent.team == team {
          return entity
        }
      }
      return nil
    }
    
  }
  
  func moveComponentsForTeam(team: Team) -> [MoveComponent] {
    let entities = entitiesForTeam(team)
    var moveComponents = [MoveComponent]()
    for entity in entities {
      if let moveComponent = entity.componentForClass(MoveComponent.self) {
        moveComponents.append(moveComponent)
      }
    }
    return moveComponents
  }
  
  func castleForTeam(team: Team) -> GKEntity? {
    for entity in entities {
      if let teamComponent = entity.componentForClass(TeamComponent.self),
             _ = entity.componentForClass(CastleComponent.self) {
        if teamComponent.team == team {
          return entity
        }
      }
    }
    return nil
  }
  
  func update(deltaTime: CFTimeInterval) {
    for componentSystem in componentSystems {
      componentSystem.updateWithDeltaTime(deltaTime)
    }
    
    for curRemove in toRemove {
      for componentSystem in componentSystems {
        componentSystem.removeComponentWithEntity(curRemove)
      }
    }
    toRemove.removeAll()
    }

    
    
//    func makeLogger() -> (String) -> String {
//        func log(s:String) -> String {
//            println(s)
//            return(s)
//        }
//        return(log)
//    }
    func createNurse() -> (Team, SKAction) -> (){

        func spawnNurse(team: Team, action: SKAction) -> () {
        guard let teamEntity = castleForTeam(team),
            teamCastleComponent = teamEntity.componentForClass(CastleComponent.self),
            teamSpriteComponent = teamEntity.componentForClass(SpriteComponent.self) else {
                return
        }
        
        if teamCastleComponent.coins < costZap {
            return
        }
        
        teamCastleComponent.coins -= 75
        scene.runAction(SoundManager.sharedInstance.soundSpawn)
        
        let monster = Nurse(team: team, entityManager: self)
        if let spriteComponent = monster.componentForClass(SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: teamSpriteComponent.node.position.x, y: CGFloat.random(min: scene.size.height * 0.25, max: scene.size.height * 0.75))
            spriteComponent.node.zPosition = 2
        }
        add(monster)
    }
    return (spawnNurse)
    }
    
    
    func createQuick() -> (Team,SKAction) -> (){

    func spawnQuirk(team: Team, disneyAnimation: SKAction) -> (){
        var whatTeam: String!
        var whichSchool: String!
        
        switch(team) {
        case.Team1:
            whatTeam = "1"
            whichSchool = p1string
            
            break
            
        case.Team2:
            whatTeam = "2"
            whichSchool = p2string
            break
        }
        
    guard let teamEntity = castleForTeam(team),
          teamCastleComponent = teamEntity.componentForClass(CastleComponent.self),
          teamSpriteComponent = teamEntity.componentForClass(SpriteComponent.self) else {
      return
    }
    
    if teamCastleComponent.coins < costQuirk {
      return
    }
    
    teamCastleComponent.coins -= costQuirk
    scene.runAction(SoundManager.sharedInstance.soundSpawn)
    
        let monster = Quirk(team: team, entityManager: self, imageName: whichSchool + whatTeam + "quirk" + "1")
    if let spriteComponent = monster.componentForClass(SpriteComponent.self) {
      spriteComponent.node.position = CGPoint(x: teamSpriteComponent.node.position.x, y: CGFloat.random(min: scene.size.height * 0.25, max: scene.size.height * 0.75))
      spriteComponent.node.zPosition = 2
      spriteComponent.node.runAction(disneyAnimation)
        spriteComponent.node.xScale = -1

    
    }
    add(monster)
  }
        return (spawnQuirk)
    }
        
func createShooter() -> (Team,SKAction) -> (){

        func spawnZap(team: Team, disneyAnimation: SKAction) -> () {
        
        
        var whatTeam: String!
        var whichSchool: String!
        
        
        switch(team) {
        case.Team1:
            whatTeam = "1"
            whichSchool = p1string
            
            break
            
        case.Team2:
            whatTeam = "2"
            whichSchool = p2string
            break
        }
        
    guard let teamEntity = castleForTeam(team),
          teamCastleComponent = teamEntity.componentForClass(CastleComponent.self),
          teamSpriteComponent = teamEntity.componentForClass(SpriteComponent.self) else {
      return
    }
    
    if teamCastleComponent.coins < costZap {
      return
    }
    
    teamCastleComponent.coins -= costZap
    scene.runAction(SoundManager.sharedInstance.soundSpawn)
    
    let monster = Zap(team: team, entityManager: self, imageName: whichSchool + whatTeam + "zap" + "1")
    if let spriteComponent = monster.componentForClass(SpriteComponent.self) {
      spriteComponent.node.position = CGPoint(x: teamSpriteComponent.node.position.x, y: CGFloat.random(min: scene.size.height * 0.25, max: scene.size.height * 0.75))
      spriteComponent.node.zPosition = 2
        spriteComponent.node.runAction(disneyAnimation)
    }
    add(monster)
  }
    
        return (spawnZap)
    
    }
        
func createTank() -> (Team,SKAction) -> (){

    func spawnMunch(team: Team, disneyAnimation: SKAction) -> () {
        
        print("createdMunch")
        
        var whatTeam: String!
        var whichSchool: String!
        
        
        switch(team) {
        case.Team1:
            whatTeam = "1"
            whichSchool = p1string
            
            break
            
        case.Team2:
            whatTeam = "2"
            whichSchool = p2string
            break
        }
        
    guard let teamEntity = castleForTeam(team),
          teamCastleComponent = teamEntity.componentForClass(CastleComponent.self),
          teamSpriteComponent = teamEntity.componentForClass(SpriteComponent.self) else {
      return
    }
    
    if teamCastleComponent.coins < costMunch {
      return
    }
    
    teamCastleComponent.coins -= costMunch
    scene.runAction(SoundManager.sharedInstance.soundSpawn)
    
    let monster = Munch(team: team, entityManager: self, imageName: whichSchool + whatTeam + "munch" + "1")
    if let spriteComponent = monster.componentForClass(SpriteComponent.self) {
      spriteComponent.node.position = CGPoint(x: teamSpriteComponent.node.position.x, y: CGFloat.random(min: scene.size.height * 0.25, max: scene.size.height * 0.75))
      spriteComponent.node.zPosition = 2
        spriteComponent.node.runAction(disneyAnimation)
    }
    add(monster)
    }
    return (spawnMunch)
    }
        
func createBomber() -> (Team,SKAction) -> (){

    func spawnBomber(team: Team, disneyAnimation: SKAction) -> () {

    }
    
    return (spawnBomber)
}
        
func createFreezer() -> (Team,SKAction) -> (){
        
    func spawnFreezer(team: Team, disneyAnimation: SKAction) -> () {
    
    }
            
    return (spawnFreezer)
        
        }
    
    func randomFunction() -> (Team,SKAction) -> (){
        
        func randomFunc(team: Team, disneyAnimation: SKAction) -> () {
            
        }
        
        return (randomFunc)
        
    }
    
        
func createMoney() -> (Team,SKAction) -> () {
    func spawnMoney(team: Team, disneyAnimation: SKAction) -> (){
        
    }
            return (spawnMoney)
        }
        
func createTurret() -> (Team,SKAction) -> (){
        
    func spawnTurret(team: Team, disneyAnimation: SKAction) -> () {
        
    }
    
    return (spawnTurret)
        }
    
    func bombAll()
    {
        for index in entities
        {
            if ((index).componentForClass(CastleComponent) == nil)
            {
                remove (index)
            }
        }
        
    }

}