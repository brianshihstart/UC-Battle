//
//  MonsterBehavior.swift
//  MonsterWars
//
//  Created by Main Account on 11/3/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class moneyBagBehavior: GKBehavior {
    
    init(targetSpeed: Float, seek: GKAgent) {
        super.init()
        if targetSpeed > 0 {
            setWeight(0.1, forGoal: GKGoal(toReachTargetSpeed: targetSpeed))
            setWeight(0.5, forGoal: GKGoal(toSeekAgent: seek))
        }
    }
    
}