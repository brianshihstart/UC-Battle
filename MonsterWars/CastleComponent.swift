//
//  CastleComponent.swift
//  MonsterWars
//
//  Created by Main Account on 11/3/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class CastleComponent: GKComponent {  

  var attacking = true
  var coins = 0
  var lastCoinDrop = NSTimeInterval(0)
    var classy: String!
    
    init(school: String) {
        super.init()
        classy = school
        
    }
    
  override func updateWithDeltaTime(seconds: NSTimeInterval) {
    
    super.updateWithDeltaTime(seconds)
    
    // Handle coins
    let coinDropInterval = NSTimeInterval(0.5)
    let coinsPerInterval = 20
    if (CACurrentMediaTime() - lastCoinDrop > coinDropInterval) {
      lastCoinDrop = CACurrentMediaTime()
      coins += coinsPerInterval
    }
    
    // Update player image
    if let spriteComponent = entity?.componentForClass(SpriteComponent.self),
      teamComponent = entity?.componentForClass(TeamComponent.self) {
       // spriteComponent.node.texture = SKTexture(imageNamed: classy + "\(teamComponent.team.rawValue)castle")
      
    }
    
  }
  
}