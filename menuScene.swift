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

class MenuScene: SKScene
{
    
    var playerSchool: Int?
    let Background: SKSpriteNode

    
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
    var troll: SKSpriteNode!

    
    init(size:CGSize, nextButton:String, background:String)
    {
        playerSchool = 0
        Background = SKSpriteNode(imageNamed: background)
        
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
        troll = SKSpriteNode(imageNamed: "next")

        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //#5
    func addChildToScene()
    {
        
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
        
        troll.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        troll.position = CGPointMake(20+self.size.width*5/6, self.size.height*5/6)
        troll.zPosition = 3
        addChild(troll)
        

        
        
        
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
    
    
    
    
    override func didMoveToView(view: SKView)
    {
        addSchoolLabel()
        
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
        troll.name = "troll"
        
        addChildToScene()
    }
    // Berkeley(1), Davis (2), Irvine (3), LA (4), Merced (5), Riverside (6), San Diego (7), Santa Barbara (8), Santa Cruz (9)
    
    //        berkeley = ButtonNode(iconName: "berk", text: "", onButtonPress: berkPressed)
    //        davis = ButtonNode(iconName: "davis", text: "", onButtonPress: davisPressed)
    //        irvine = ButtonNode(iconName: "irvine", text: "", onButtonPress: irvinePressed)
    //        la = ButtonNode(iconName: "la", text: "", onButtonPress: berkPressed)
    //        merced = ButtonNode(iconName: "merced", text: "", onButtonPress: berkPressed)
    //        riverside = ButtonNode(iconName: "riverside", text: "", onButtonPress: berkPressed)
    //        sandiego = ButtonNode(iconName: "sandiego", text: "", onButtonPress: berkPressed)
    //        santabarbara = ButtonNode(iconName: "santabarbara", text: "", onButtonPress: berkPressed)
    
    
    //    {
    //        print("You are in a MenuScene")
    //        addChildToScene();
    //
    //        PlayButton.name = "PLAY"
    //        //generateTestTexture()
    //        addShaderSceneBtn()
    //        addNodeMenuSceneBtn()
    //        addScoreSceneBtn()
    
    func goToP1Select() {
        
        let transitionEffect = SKTransition.fadeWithDuration(1.0)
        let p1selection = p1SelectionScene(size: CGSize(width:self.size.width, height:self.size.height), school: self.playerSchool!)
        
        self.view?.presentScene(p1selection)
    }
    
    func addSchoolLabel(){
        schoolType.fontSize = 50
        schoolType.fontColor = SKColor.whiteColor()
        schoolType.text = "Player 1: Select A School"
        
        schoolType.position = CGPointMake(frame.size.width/4 + 80, frame.size.height*0.8)
        self.addChild(schoolType)
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
        troll.name = "troll"
        
        
        
        
        for touch: AnyObject in touches
        {
            //        scoreLabel.text = "SCORE: \(score)"
            
            let location = touch.locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            
            if node.name == "berkeley"
            {
                playerSchool = 1
                schoolType.text = "Player 1: UC Berkeley"
                makeNotBlack(stringOfButton)
                stringOfButton = "berkeley"
                berkeley.alpha = 0.2
                
                print("team1 haha")
                print(playerSchool)
            }
            else if node.name == "davis"
            {
                playerSchool = 2
                schoolType.text = "Player 1: UC Davis"
                makeNotBlack(stringOfButton)
                davis.alpha = 0.2
                stringOfButton = "davis"
                
                print("team1 haha")
                print(playerSchool)
                
            }
            else if node.name == "irvine"
            {
                playerSchool = 3
                schoolType.text = "Player 1: UC Irvine"
                makeNotBlack(stringOfButton)
                irvine.alpha = 0.2
                stringOfButton = "irvine"
                print("team1 haha")
                print(playerSchool)

                
            }
            else if node.name == "la"
            {
                playerSchool = 4
                schoolType.text = "Player 1: UCLA"
                makeNotBlack(stringOfButton)
                la.alpha = 0.2
                stringOfButton = "la"
                
                print("team1 haha")
                print(playerSchool)

            }
            else if node.name == "merced"
            {
                playerSchool = 5
                schoolType.text = "Player 1: UC Mercedes"
                makeNotBlack(stringOfButton)
                merced.alpha = 0.2
                stringOfButton = "merced"
                print("team1 haha")
                print(playerSchool)

            }
            else if node.name == "riverside"
            {
                playerSchool = 6
                schoolType.text = "Player 1: UC Riverside"
                makeNotBlack(stringOfButton)
                riverside.alpha = 0.2
                stringOfButton = "riverside"
                print("team1 haha")
                print(playerSchool)

            }
            else if node.name == "sandiego"
            {
                playerSchool = 7
                schoolType.text = "Player 1: UCSD"
                makeNotBlack(stringOfButton)
                sandiego.alpha = 0.2
                stringOfButton = "sandiego"
                print("team1 haha")
                print(playerSchool)

            }
            else if node.name == "santa"
            {
                playerSchool = 8
                schoolType.text = "Player 1: UCSB"
                makeNotBlack(stringOfButton)
                santabarbara.alpha = 0.2
                stringOfButton = "santa"
                print("team1 haha")
                print(playerSchool)

                
                
            }
            else if node.name == "santacruz"
            {
                playerSchool = 9
                schoolType.text = "Player 1: UCSC"
                makeNotBlack(stringOfButton)
                santacruz.alpha = 0.2
                stringOfButton = "santacruz"
                print("team1 haha")
                print(playerSchool)

                
            }
            else if node.name == "usc"
            {
                playerSchool = 10
                schoolType.text = "Player 1: USC"
                makeNotBlack(stringOfButton)
                usc.alpha = 0.2
                stringOfButton = "usc"
                print("team1 haha")
                print(playerSchool)
}
            else if node.name == "troll"
                        {
                            print("hi")
                            
                            goToP1Select()
}
            
        }
        
    }
    //        for touch: AnyObject in touches
    //        {
    //            let location = touch.locationInNode(self)
    //            let node = self.nodeAtPoint(location)
    //
    //            if node.name == PlayButton.name
    //            {
    //                goToGameScene()
    //                //goToShaderScene()
    //            }
    //            else if node.name == "SHADOWS"
    //            {
    //                goToShaderScene()
    //            }
    //            else if node.name == "NODEMENU"
    //            {
    //                goToNodeMenuScene()
    //            }
    //            else if node.name == "SCOREMENU"
    //            {
    //                goToScoreScene()
    //            }
    //        }
}
/*
 
 class MenuScene: SKScene
 {
 // SCORE MENU
 var scoreScene : AddScoreScene?
 var gameScene : GameScene?
 
 var shaderSceneInstance : ShaderDemo?
 var nodeMenuSceneInstance : NodeMenuScene?
 var tintChanger : Float?
 
 let testingTexture : SKTexture
 
 //#1
 let PlayButton: SKSpriteNode
 let Background: SKSpriteNode
 
 //#2
 init(size:CGSize, playbutton:String, background:String)
 {
 PlayButton = SKSpriteNode(imageNamed: playbutton)
 Background = SKSpriteNode(imageNamed: background)
 testingTexture = SKTexture(imageNamed: playbutton)
 super.init(size:size)
 }
 
 //#3
 required init?(coder aDecoder: NSCoder)
 {
 fatalError("init(coder:) has not been implemented")
 }
 
 //====================================================================================================================//
 
 //#4
 override func didMoveToView(view: SKView)
 {
 print("You are in a MenuScene")
 addChildToScene();
 
 PlayButton.name = "PLAY"
 //generateTestTexture()
 addShaderSceneBtn()
 addNodeMenuSceneBtn()
 addScoreSceneBtn()
 }
 
 //====================================================================================================================//
 
 func generateTestTexture()
 {
 for var i = 0 ; i < 10; i++
 {
 let temp = SKSpriteNode(texture: testingTexture)
 temp.xScale = 100/temp.size.width
 temp.yScale = 50/temp.size.height
 temp.zPosition = 2
 // println(self.size)
 temp.position = CGPointMake(-self.size.width + CGFloat (100 * i), -self.size.height/2)
 addChild(temp)
 }
 }
 
 //====================================================================================================================//
 
 //#5
 func addChildToScene()
 {
 PlayButton.zPosition = 1
 Background.zPosition = 0
 PlayButton.color = UIColor.redColor()
 
 Background.size = CGSize(width:self.size.width, height:self.size.height)
 
 //        Background.position = CGPointMake(-self.size.width/2, -self.size.height/2)
 //        PlayButton.position = CGPointMake(-self.size.width/2, -self.size.height/2)
 
 addChild(PlayButton)
 addChild(Background)
 }
 
 //====================================================================================================================//
 
 //#6
 override func update(currentTime: NSTimeInterval)
 {
 tintPlayButton()
 
 }
 
 //====================================================================================================================//
 
 var once:Bool = true
 
 override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
 {
 for touch: AnyObject in touches
 {
 let location = touch.locationInNode(self)
 let node = self.nodeAtPoint(location)
 
 if node.name == PlayButton.name
 {
 goToGameScene()
 //goToShaderScene()
 }
 else if node.name == "SHADOWS"
 {
 goToShaderScene()
 }
 else if node.name == "NODEMENU"
 {
 goToNodeMenuScene()
 }
 else if node.name == "SCOREMENU"
 {
 goToScoreScene()
 }
 }
 }
 
 //====================================================================================================================//
 
 func goToScoreScene()
 {
 let transitionEffect = SKTransition.flipHorizontalWithDuration(1.0)
 scoreScene = AddScoreScene(size: self.size) // , playbutton: "Play", background: "BG")
 scoreScene!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
 self.view?.presentScene(scoreScene! , transition:transitionEffect)
 }
 
 //====================================================================================================================//
 
 func goToGameScene()
 {
 let transitionEffect = SKTransition.flipHorizontalWithDuration(1.0)
 gameScene = GameScene(size: self.size)
 gameScene!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
 self.view?.presentScene(gameScene! , transition:transitionEffect)
 }
 
 //====================================================================================================================//
 
 func goToShaderScene()
 {
 let transitionEffect = SKTransition.flipHorizontalWithDuration(1.0)
 shaderSceneInstance = ShaderDemo(size: self.size)
 shaderSceneInstance!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
 self.view?.presentScene(shaderSceneInstance! , transition:transitionEffect)
 }
 
 //====================================================================================================================//
 
 func goToNodeMenuScene()
 {
 let transitionEffect = SKTransition.flipHorizontalWithDuration(1.0)
 nodeMenuSceneInstance = NodeMenuScene(size: self.size)
 nodeMenuSceneInstance!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
 self.view?.presentScene(nodeMenuSceneInstance! , transition:transitionEffect)
 }
 
 //====================================================================================================================//
 
 func tintPlayButton()
 {
 if PlayButton.colorBlendFactor >= 1
 {
 tintChanger = -0.02
 }
 else if PlayButton.colorBlendFactor <= 0
 {
 tintChanger = 0.02
 }
 PlayButton.colorBlendFactor += CGFloat(tintChanger!)
 }
 
 //====================================================================================================================//
 
 func addShaderSceneBtn()
 {
 let backbutton = SKLabelNode(fontNamed: FontFile)
 backbutton.fontColor = UIColor.blueColor()
 backbutton.name = "SHADOWS"
 backbutton.text = "SHADOW EFFECT"
 backbutton.position = CGPointMake(CGRectGetMinX(self.frame) + backbutton.frame.width/2 , CGRectGetMinY(self.frame) )
 backbutton.zPosition = 3
 self.addChild(backbutton)
 }
 
 //====================================================================================================================//
 
 func addNodeMenuSceneBtn()
 {
 let backbutton = SKLabelNode(fontNamed: FontFile)
 backbutton.fontColor = UIColor.blueColor()
 backbutton.name = "NODEMENU"
 backbutton.text = "NODE MENU SCENE"
 backbutton.position = CGPointMake(CGRectGetMinX(self.frame) + backbutton.frame.width*2 , CGRectGetMaxY(self.frame) - backbutton.frame.width/8)
 backbutton.zPosition = 3
 self.addChild(backbutton)
 }
 
 //====================================================================================================================//
 
 func addScoreSceneBtn()
 {
 let scoreButton = SKLabelNode(fontNamed: FontFile)
 scoreButton.fontColor = UIColor.blueColor()
 scoreButton.name = "SCOREMENU"
 scoreButton.text = "SCORE MENU"
 scoreButton.position = CGPointMake(CGRectGetMinX(self.frame)+scoreButton.frame.width/2, CGRectGetMaxY(self.frame) - scoreButton.frame.height)
 scoreButton.zPosition = 3
 self.addChild(scoreButton)
 }
 
 //====================================================================================================================//
 
 }
 
 */