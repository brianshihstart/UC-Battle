//
//  MenuScene.swift
//  MonsterWars
//
//  Created by Brian Shih on 4/29/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//
import Foundation
import SpriteKit
import UIKit
class MenuScene2: SKScene
{
    var playerSchool: Int?
    let PlayButton: SKSpriteNode
    let Background: SKSpriteNode
    
    let p1first: String
    let p1second: String
    let p1third: String
    let p1fourth: String

    
    
    var schoolType = SKLabelNode(fontNamed: "Komika Axis")
    
    // Berkeley(1), Davis (2), Irvine (3), LA (4), Merced (5), Riverside (6), San Diego (7), Santa Barbara (8), Santa Cruz (9)
    
    var berkeley: SKSpriteNode!
    var davis: SKSpriteNode!
    var irvine: SKSpriteNode!
    var la: SKSpriteNode!
    var merced: SKSpriteNode!
    var riverside: SKSpriteNode!
    var sandiego: SKSpriteNode!
    var santabarbara: SKSpriteNode!
    var santacruz: SKSpriteNode!
    var usc: SKSpriteNode!
    var battle: SKSpriteNode!
    var back: SKSpriteNode!
    
    //    var quirkButton: ButtonNode!
    //    quirkButton = ButtonNode(iconName: "quirk1", text: "10", onButtonPress: quirkPressed)
    //    quirkButton.position = CGPoint(x: size.width * 0.25, y: margin + quirkButton.size.height / 2)
    //    addChild(quirkButton)
    
    var p1school: Int!
    
    init(size:CGSize, nextButton:String, background:String, firstSchool: Int, p1firstSelect: String, p1secondSelect: String, p1thirdSelect: String, p1fourthSelect: String)
    {
        
        p1first = p1firstSelect
        p1second = p1secondSelect
        p1third = p1thirdSelect
        p1fourth = p1fourthSelect
        
        
        p1school = firstSchool
        playerSchool = 0
        PlayButton = SKSpriteNode(imageNamed: nextButton)
        Background = SKSpriteNode(imageNamed: background)
        
        
        back = SKSpriteNode(imageNamed: "back")
        berkeley = SKSpriteNode(imageNamed: "berkeley")
        davis = SKSpriteNode(imageNamed: "davis")
        irvine = SKSpriteNode(imageNamed: "irvine")
        la = SKSpriteNode(imageNamed: "la")
        merced = SKSpriteNode(imageNamed: "merced")
        riverside = SKSpriteNode(imageNamed: "riverside")
        sandiego = SKSpriteNode(imageNamed: "sandiego")
        santabarbara = SKSpriteNode(imageNamed: "santabarbara")
        santacruz = SKSpriteNode(imageNamed: "santacruz")
        usc = SKSpriteNode(imageNamed: "usc")
        battle = SKSpriteNode(imageNamed: "battle")
        
        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var breath = SKAction()
    
    func createAnimations() {
        let fadeOutGroup = SKAction.group([
            SKAction.scaleTo(1.2, duration: 0.5),
            SKAction.fadeAlphaTo(0.3, duration: 0.5)
            ]);
        // Create a fade in action group:
        // The ghost returns to full size and initial transparency.
        let fadeInGroup = SKAction.group([
            SKAction.fadeAlphaTo(0.8, duration: 0.5),
            SKAction.scaleTo(1, duration: 0.5)
            ]);
        // Package the groups into a sequence, then a repeatActionForever action:
        let fadeSequence = SKAction.sequence([fadeOutGroup, fadeInGroup])
        breath = SKAction.repeatActionForever(fadeSequence)
        
    }
    
    //#5
    func addChildToScene()
    {
        
        
        back.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.25)
        back.position = CGPointMake(self.size.width/6, self.size.height/2 + 50)
        back.zPosition = 5
        addChild(back)
        
        berkeley.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        berkeley.position = CGPointMake(self.size.width/6, self.size.height/2)
        berkeley.zPosition = 1
        addChild(berkeley)
        
        davis.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        davis.position = CGPointMake(self.size.width*2/6, self.size.height/2)
        davis.zPosition = 1
        addChild(davis)
        
        irvine.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        irvine.position = CGPointMake(self.size.width*3/6, self.size.height/2)
        irvine.zPosition = 1
        addChild(irvine)
        
        la.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        la.position = CGPointMake(self.size.width*4/6, self.size.height/2)
        la.zPosition = 1
        addChild(la)
        
        merced.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        merced.position = CGPointMake(self.size.width*5/6, self.size.height/2)
        merced.zPosition = 1
        addChild(merced)
        
        riverside.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        riverside.position = CGPointMake(self.size.width/6, self.size.height*1/6)
        riverside.zPosition = 1
        addChild(riverside)
        
        sandiego.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        sandiego.position = CGPointMake(self.size.width*2/6, self.size.height*1/6)
        sandiego.zPosition = 1
        addChild(sandiego)
        
        santabarbara.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        santabarbara.position = CGPointMake(self.size.width*3/6, self.size.height*1/6)
        santabarbara.zPosition = 1
        addChild(santabarbara)
        
        santacruz.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        santacruz.position = CGPointMake(10+self.size.width*4/6, self.size.height*1/6)
        santacruz.zPosition = 1
        addChild(santacruz)
        
        usc.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        usc.position = CGPointMake(20+self.size.width*5/6, self.size.height*1/6)
        usc.zPosition = 1
        addChild(usc)
        
        battle.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        battle.position = CGPointMake(20+self.size.width*5/6, self.size.height*5/6)
        battle.zPosition = 1
        addChild(battle)

        
      
    }
    
    
    
    
    override func didMoveToView(view: SKView)
    {
        addSchoolLabel()
        createAnimations()
        back.name = "back"
        berkeley.name = "UC Berkeley"
        davis.name = "UC Davis"
        irvine.name = "UC Irvine"
        la.name = "UCLA"
        merced.name = "UC Merced"
        riverside.name = "UC Riverside"
        sandiego.name = "UC San Diego"
        santabarbara.name = "UC Santa Barbara"
        santacruz.name = "UC Santa Cruz"
        usc.name = "University of Southern California"
        battle.name = "battle"
        
        addChildToScene()
        battle.runAction(breath)
    }
    // Berkeley(1), Davis (2), Irvine (3), LA (4), Merced (5), Riverside (6), San Diego (7), Santa Barbara (8), Santa Cruz (9)
  
    func goTosecondSelectionScene() {

        let transitionEffect = SKTransition.fadeWithDuration(1.0)
        let p2selection = p2SelectionScene(size: CGSize(width:self.size.width, height:self.size.height), p1school: p1school, p2school: playerSchool!, p1firsty: p1first, p1secondy: p1second, p1thirdy: p1third, p1fourthy: p1fourth)
        
        self.view?.presentScene(p2selection)
        
        
    }

    
    func addSchoolLabel(){
        schoolType.fontSize = 50
        schoolType.fontColor = SKColor.whiteColor()
        schoolType.text = "Player 2: Select A School"
        
        schoolType.position = CGPointMake(frame.size.width/4 + 80, frame.size.height*0.8)
        self.addChild(schoolType)
    }
    
    func backToFirstMenu() {
        
        let player1menu = MenuScene(size: CGSize(width:self.size.width, height:self.size.height), nextButton: "nextButton", background: "background")
        
        self.view?.presentScene(player1menu)
        

        
    }
    
    func makeNotBlack(currentValue: String) {
        
        
        
        if currentValue == "berkeley"
        {
            
            berkeley.alpha = 1
            
        }
        else if currentValue == "davis"
        {
           
            davis.alpha = 1
            
        }
        else if currentValue == "irvine"
        {
            
            irvine.alpha = 1.0
            
            
        }
        else if currentValue == "la"
        {
            
            la.alpha = 1.0
            
            
        }
        else if currentValue == "merced"
        {
            
            merced.alpha = 1.0
            
        }
        else if currentValue == "riverside"
        {
            
            riverside.alpha = 1.0
            
        }
        else if currentValue == "sandiego"
        {
                        sandiego.alpha = 1.0
            
        }
        else if currentValue == "santa"
        {
            
            santabarbara.alpha = 1.0
            
        }
        else if currentValue == "santacruz"
        {
            
            santacruz.alpha = 1.0
            
        }
        else if currentValue == "usc"
        {
            
            usc.alpha = 1.0
        }

        
    }
    
    
    var stringOfButton: String = ""
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        // Berkeley(1), Davis (2), Irvine (3), LA (4), Merced (5), Riverside (6), San Diego (7), Santa Barbara (8), Santa Cruz (9)
        
        back.name = "back"
        berkeley.name = "berkeley"
        davis.name = "davis"
        irvine.name = "irvine"
        la.name = "la"
        merced.name = "merced"
        riverside.name = "riverside"
        sandiego.name = "sandiego"
        santabarbara.name = "santa"
        santacruz.name = "santacruz"
        usc.name = "usc"
        battle.name = "battle"
        //troll.name = "troll"
        
        
        
        
        for touch: AnyObject in touches
        {
            //        scoreLabel.text = "SCORE: \(score)"
            
            let location = touch.locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            if node.name == PlayButton.name
            {
                goTosecondSelectionScene()
            }
            else if node.name == "berkeley"
            {
                playerSchool = 1
                schoolType.text = "Player 2: UC Berkeley"
                makeNotBlack(stringOfButton)
                stringOfButton = "berkeley"
                berkeley.alpha = 0.2
                

                print("team2 haha")
                print(playerSchool)

            }
            else if node.name == "davis"
            {
                playerSchool = 2
                schoolType.text = "Player 2: UC Davis"
                makeNotBlack(stringOfButton)
                davis.alpha = 0.2
                stringOfButton = "davis"

                print("team2 haha")
                print(playerSchool)
                
            }
            else if node.name == "irvine"
            {
                playerSchool = 3
                schoolType.text = "Player 2: UC Irvine"
                makeNotBlack(stringOfButton)
                irvine.alpha = 0.2
                stringOfButton = "irvine"
                print("team2 haha")
                print(playerSchool)

                
            }
            else if node.name == "la"
            {
                playerSchool = 4
                schoolType.text = "Player 2: UCLA"
                makeNotBlack(stringOfButton)
                la.alpha = 0.2
                stringOfButton = "la"

                print("team2 haha")
                print(playerSchool)

            }
            else if node.name == "merced"
            {
                playerSchool = 5
                schoolType.text = "Player 2: UC Mercedes"
                makeNotBlack(stringOfButton)
                merced.alpha = 0.2
                stringOfButton = "merced"
                print("team2 haha")
                print(playerSchool)


            }
            else if node.name == "riverside"
            {
                playerSchool = 6
                schoolType.text = "Player 2: UC Riverside"
                makeNotBlack(stringOfButton)
                riverside.alpha = 0.2
                stringOfButton = "riverside"
                print("team2 haha")
                print(playerSchool)

            }
            else if node.name == "sandiego"
            {
                playerSchool = 7
                schoolType.text = "Player 2: UCSD"
                makeNotBlack(stringOfButton)
                sandiego.alpha = 0.2
                stringOfButton = "sandiego"
                print("team2 haha")
                print(playerSchool)

            }
            else if node.name == "santa"
            {
                playerSchool = 8
                schoolType.text = "Player 2: UCSB"
                makeNotBlack(stringOfButton)
                santabarbara.alpha = 0.2
                stringOfButton = "santa"
                print("team2 haha")
                print(playerSchool)

                
            }
            else if node.name == "santacruz"
            {
                playerSchool = 9
                schoolType.text = "Player2: UCSC"
                makeNotBlack(stringOfButton)
                santacruz.alpha = 0.2
                stringOfButton = "santacruz"
                print("team2 haha")
                print(playerSchool)


            }
            else if node.name == "usc"
            {
                playerSchool = 10
                schoolType.text = "Player2: USC"
                makeNotBlack(stringOfButton)
                usc.alpha = 0.2
                stringOfButton = "usc"
                print("team2 haha")
                print(playerSchool)
}
            else if node.name == "battle" {
                goTosecondSelectionScene()
                
            }
            else if node.name == "back" {
                
                backToFirstMenu()
                
            }
        }}

}
