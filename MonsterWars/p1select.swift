
//
//  Created by Brian Shih on 4/29/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//
import Foundation
import SpriteKit
import UIKit

class p1SelectionScene: SKScene
{
    
    var playerSchool: Int?
    //    let Background: SKSpriteNode
    
    var firstSelection = SKLabelNode(fontNamed: "Komika Axis")
    var secondSelection = SKLabelNode(fontNamed: "Komika Axis")
    var thirdSelection = SKLabelNode(fontNamed: "Komika Axis")
    var fourthSelection = SKLabelNode(fontNamed: "Komika Axis")
    var next = SKLabelNode(fontNamed: "Komika Axis")
    
    
    var numberSelected = 0
    
    
    
    
    
    // Berkeley(1), Davis (2), Irvine (3), LA (4), Merced (5), Riverside (6), San Diego (7), Santa Barbara (8), Santa Cruz (9)
    
    var bomberButton: SKSpriteNode!
    var freezerButton: SKSpriteNode!
    var moneyButton: SKSpriteNode!
    var turretButton: SKSpriteNode!
    var quickButton: SKSpriteNode!
    var tankButton: SKSpriteNode!
    var nurseButton: SKSpriteNode!
    var shooterButton: SKSpriteNode!
    var lastMenu: MenuScene!

    
    init(size:CGSize, school: Int)
    {
        

        playerSchool = school
        //        Background = SKSpriteNode(imageNamed: background)
        
        bomberButton = SKSpriteNode(imageNamed: "bomberButton")
        freezerButton = SKSpriteNode(imageNamed: "freezerButton")
        moneyButton = SKSpriteNode(imageNamed: "moneyButton")
        turretButton = SKSpriteNode(imageNamed: "turretButton")
        quickButton = SKSpriteNode(imageNamed: "quickButton")
        tankButton = SKSpriteNode(imageNamed: "tankButton")
        nurseButton = SKSpriteNode(imageNamed: "nurseeButton")
        shooterButton = SKSpriteNode(imageNamed: "shooterButton")
        
        
        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func goToSecondMenu() {
        let transitionEffect = SKTransition.fadeWithDuration(1.0)
        
        let player2menu = MenuScene2(size: CGSize(width:self.size.width, height:self.size.height), nextButton: "nextButton", background: "background", firstSchool: playerSchool!, p1firstSelect: firstSelection.text!,p1secondSelect: secondSelection.text!, p1thirdSelect: thirdSelection.text!, p1fourthSelect: fourthSelection.text!)
        
        self.view?.presentScene(player2menu)
        
        
        
    }

    
    
    func addSchoolLabel(){
        firstSelection.fontSize = 25
        firstSelection.name = "firstSelection"
        firstSelection.text = "?"
        firstSelection.position = CGPointMake(1 * frame.size.width/4 - 50, frame.size.height*0.8)
        self.addChild(firstSelection)
        
        secondSelection.fontSize = 25
        secondSelection.name = "secondSelection"
        secondSelection.text = "?"
        secondSelection.position = CGPointMake(2 * frame.size.width/4 - 50, frame.size.height*0.8)
        self.addChild(secondSelection)
        
        thirdSelection.fontSize = 25
        thirdSelection.name = "thirdSelection"
        thirdSelection.text = "?"
        thirdSelection.position = CGPointMake(3 * frame.size.width/4 - 50 , frame.size.height*0.8)
        self.addChild(thirdSelection)
        
        fourthSelection.fontSize = 25
        fourthSelection.name = "fourthSelection"
        fourthSelection.text = "?"
        fourthSelection.position = CGPointMake(4 * frame.size.width/4 - 50, frame.size.height*0.8)
        self.addChild(fourthSelection)
        
        next.fontSize = 25
        next.name = "next"
        next.text = "?"
        next.position = CGPointMake(4 * frame.size.width/4 - 50, frame.size.height*0.2)
        next.hidden = true
        self.addChild(next)
        
        
        
    }
    
    //#5
    func addChildToScene()
    {
        
        bomberButton.size = CGSize(width:self.size.width*0.15, height:self.size.height*0.30)
        bomberButton.position = CGPointMake(self.size.width/6, self.size.height/2)
        bomberButton.zPosition = 1
        addChild(bomberButton)
        
        freezerButton.size = CGSize(width:self.size.width*0.15, height:self.size.height*0.30)
        freezerButton.position = CGPointMake(self.size.width*2/6, self.size.height/2)
        freezerButton.zPosition = 1
        addChild(freezerButton)
        
        moneyButton.size = CGSize(width:self.size.width*0.15, height:self.size.height*0.30)
        moneyButton.position = CGPointMake(self.size.width*3/6, self.size.height/2)
        moneyButton.zPosition = 1
        addChild(moneyButton)
        
        turretButton.size = CGSize(width:self.size.width*0.15, height:self.size.height*0.30)
        turretButton.position = CGPointMake(self.size.width*4/6, self.size.height/2)
        turretButton.zPosition = 1
        addChild(turretButton)
        
        quickButton.size = CGSize(width:self.size.width*0.15, height:self.size.height*0.30)
        quickButton.position = CGPointMake(self.size.width*5/6, self.size.height/2)
        quickButton.zPosition = 1
        addChild(quickButton)
        
        tankButton.size = CGSize(width:self.size.width*0.15, height:self.size.height*0.30)
        tankButton.position = CGPointMake(self.size.width/6, self.size.height*1/6)
        tankButton.zPosition = 1
        addChild(tankButton)
        
        nurseButton.size = CGSize(width:self.size.width*0.15, height:self.size.height*0.30)
        nurseButton.position = CGPointMake(self.size.width*2/6, self.size.height*1/6)
        nurseButton.zPosition = 1
        addChild(nurseButton)
        
        shooterButton.size = CGSize(width:self.size.width*0.15, height:self.size.height*0.30)
        shooterButton.position = CGPointMake(self.size.width*3/6, self.size.height*1/6)
        shooterButton.zPosition = 1
        addChild(shooterButton)
        
        
        
        
        //        PlayButton.zPosition = 1
        //        Background.zPosition = 0
        //        PlayButton.color = UIColor.redColor()
        //
        //        Background.size = CGSize(width:self.size.width, height:self.size.height)
        //
        //        //        Background.position = CGPointMake(-self.size.width/2, -self.size.height/2)
        //        //        PlayButton.position = CGPointMake(-self.size.width/2, -self.size.height/2)
        //
        //        addChild(PlayButton)
        //        addChild(Background)
    }
    
    //    bomberButton = SKSpriteNode(imageNamed: "bomberButton")
    //    freezerButton = SKSpriteNode(imageNamed: "freezerButton")
    //    moneyButton = SKSpriteNode(imageNamed: "moneyButton")
    //    turretButton = SKSpriteNode(imageNamed: "turretButton")
    //    quickButton = SKSpriteNode(imageNamed: "quickButton")
    //    tankButton = SKSpriteNode(imageNamed: "tankButton")
    //    nurseButton = SKSpriteNode(imageNamed: "nurseButton")
    //    shooterButton = SKSpriteNode(imageNamed: "shooterButton")
    //
    
    override func didMoveToView(view: SKView)
    {
        
        bomberButton.name = "bomber"
        freezerButton.name = "freezer"
        moneyButton.name = "money"
        turretButton.name = "turret"
        quickButton.name = "quick"
        tankButton.name = "tank"
        nurseButton.name = "nurse"
        shooterButton.name = "shooter"
        
        addChildToScene()
        addSchoolLabel()
    }
    
    
    func goToGameScene() {
        
    }
    
    func alreadyExist(type: String) -> Bool {
        if firstSelection.text == type {
            return true
        }
        if secondSelection.text == type {
            return true
        }
        if thirdSelection.text == type {
            return true
        }
        if fourthSelection.text == type {
            return true
        }
        
        
        return false
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        // Berkeley(1), Davis (2), Irvine (3), LA (4), Merced (5), Riverside (6), San Diego (7), Santa Barbara (8), Santa Cruz (9)
        
        bomberButton.name = "bomber"
        freezerButton.name = "freezer"
        moneyButton.name = "money"
        turretButton.name = "turret"
        quickButton.name = "quick"
        tankButton.name = "tank"
        nurseButton.name = "nurse"
        shooterButton.name = "shooter"
        
        
        
        
        for touch: AnyObject in touches
        {
            //        scoreLabel.text = "SCORE: \(score)"
            
            let location = touch.locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            if node.name == "firstSelection" {
                
                firstSelection.text = "?"
                if numberSelected != 0 {
                    numberSelected -= 1
                }
            }
            
            if node.name == "secondSelection" {
                
                secondSelection.text = "?"
                if numberSelected != 0 {
                    numberSelected -= 1
                }
            }
            
            if node.name == "thirdSelection" {
                
                thirdSelection.text = "?"
                if numberSelected != 0 {
                    numberSelected -= 1
                }
                
            }
            
            if node.name == "fourthSelection" {
                
                fourthSelection.text = "?"
                if numberSelected != 0 {
                    numberSelected -= 1
                }
            }
            
            
            if node.name == "bomber" && alreadyExist("bomber") != true
            {
                
                if firstSelection.text == "?"{
                    firstSelection.text = "bomber"
                    numberSelected += 1
                    
                } else if secondSelection.text == "?" {
                    secondSelection.text = "bomber"
                    numberSelected += 1
                    
                } else if thirdSelection.text == "?" {
                    thirdSelection.text = "bomber"
                    numberSelected += 1
                    
                    
                } else if fourthSelection.text == "?" {
                    fourthSelection.text = "bomber"
                    numberSelected += 1
                    
                }
                
                
            }
            
            if node.name == "freezer" && alreadyExist("freezer") != true
            {
                
                if firstSelection.text == "?"{
                    firstSelection.text = "freezer"
                    numberSelected += 1
                    
                } else if secondSelection.text == "?" {
                    secondSelection.text = "freezer"
                    numberSelected += 1
                    
                } else if thirdSelection.text == "?" {
                    thirdSelection.text = "freezer"
                    numberSelected += 1
                    
                    
                } else if fourthSelection.text == "?" {
                    fourthSelection.text = "freezer"
                    numberSelected += 1
                    
                }
                
                
            }
            
            if node.name == "money" && alreadyExist("money") != true
            {
                
                if firstSelection.text == "?"{
                    firstSelection.text = "money"
                    numberSelected += 1
                    
                } else if secondSelection.text == "?" {
                    secondSelection.text = "money"
                    numberSelected += 1
                    
                } else if thirdSelection.text == "?" {
                    thirdSelection.text = "money"
                    numberSelected += 1
                    
                    
                } else if fourthSelection.text == "?" {
                    fourthSelection.text = "money"
                    numberSelected += 1
                    
                }
                
                
            }
            
            if node.name == "turret" && alreadyExist("turret") != true
            {
                
                if firstSelection.text == "?"{
                    firstSelection.text = "turret"
                    numberSelected += 1
                    
                } else if secondSelection.text == "?" {
                    secondSelection.text = "turret"
                    numberSelected += 1
                    
                } else if thirdSelection.text == "?" {
                    thirdSelection.text = "turret"
                    numberSelected += 1
                    
                    
                } else if fourthSelection.text == "?" {
                    fourthSelection.text = "turret"
                    numberSelected += 1
                    
                }
                
                
            }
            
            if node.name == "nurse" && alreadyExist("nurse") != true
            {
                
                if firstSelection.text == "?"{
                    firstSelection.text = "nurse"
                    numberSelected += 1
                    
                } else if secondSelection.text == "?" {
                    secondSelection.text = "nurse"
                    numberSelected += 1
                    
                } else if thirdSelection.text == "?" {
                    thirdSelection.text = "nurse"
                    numberSelected += 1
                    
                    
                } else if fourthSelection.text == "?" {
                    fourthSelection.text = "nurse"
                    numberSelected += 1
                    
                }
                
                
            }
            if node.name == "quick" && alreadyExist("quick") != true
            {
                
                if firstSelection.text == "?"{
                    firstSelection.text = "quick"
                    numberSelected += 1
                    
                } else if secondSelection.text == "?" {
                    secondSelection.text = "quick"
                    numberSelected += 1
                    
                } else if thirdSelection.text == "?" {
                    thirdSelection.text = "quick"
                    numberSelected += 1
                    
                    
                } else if fourthSelection.text == "?" {
                    fourthSelection.text = "quick"
                    numberSelected += 1
                    
                }
                
                
            }
            if node.name == "tank" && alreadyExist("tank") != true
            {
                
                if firstSelection.text == "?"{
                    firstSelection.text = "tank"
                    numberSelected += 1
                    
                } else if secondSelection.text == "?" {
                    secondSelection.text = "tank"
                    numberSelected += 1
                    
                } else if thirdSelection.text == "?" {
                    thirdSelection.text = "tank"
                    numberSelected += 1
                    
                    
                } else if fourthSelection.text == "?" {
                    fourthSelection.text = "tank"
                    numberSelected += 1
                    
                }
                
                
            }
            if node.name == "shooter" && alreadyExist("shooter") != true
            {
                
                if firstSelection.text == "?"{
                    firstSelection.text = "shooter"
                    numberSelected += 1
                    
                } else if secondSelection.text == "?" {
                    secondSelection.text = "shooter"
                    numberSelected += 1
                    
                } else if thirdSelection.text == "?" {
                    thirdSelection.text = "shooter"
                    numberSelected += 1
                    
                    
                } else if fourthSelection.text == "?" {
                    fourthSelection.text = "shooter"
                    numberSelected += 1
                    
                }
                
                
            }
            if node.name == "next" {
                goToSecondMenu()
            }
            
            
            
            
            
            
        }
        
        
        if numberSelected == 4 {
            next.hidden = false
        }
        if numberSelected != 4 {
            next.hidden = true
        }
        
    }
    
}