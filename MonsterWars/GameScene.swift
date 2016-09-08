//
//  GameScene.swift
//  MonsterWars
//
//  Created by Main Account on 11/3/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//
func randomFunction() -> (Team,SKAction) -> (){
    
    func randomFunc(team: Team, disneyAnimation: SKAction) {
        
    }
    
    return (randomFunc)
    
}
// comm

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var bomberAni = SKAction()
    var freezerAni = SKAction()
    var moneyAni = SKAction()
    var turretAni = SKAction()
    var quickAni = SKAction()
    var tankAni = SKAction()
    var nurseAni = SKAction()
    var shooterAni = SKAction()

    

    
    
    
    
    
    var rectangle: SKShapeNode!
    var popUpView: SKSpriteNode!
    var didPopUp = false
    
    
    let fireEmmiter = SKEmitterNode(fileNamed: "fire.sks")

    
    var player1schoolstring: String!
    var player2schoolstring: String!
    
    
    var p1firstAnimation: SKAction!
    var p1secondAnimation: SKAction!
    var p1thirdAnimation: SKAction!
    var p1fourthAnimation: SKAction!
    
    var p2firstAnimation: SKAction!
    var p2secondAnimation: SKAction!
    var p2thirdAnimation: SKAction!
    var p2fourthAnimation: SKAction!


    
    
    
    
    var p1firstType: String
    var p1secondType: String
    var p1thirdType: String
    var p1fourthType: String
    
    var p2firstType: String
    var p2secondType: String
    var p2thirdType: String
    var p2fourthType: String

//    bomber
//    freezer
//    money
//    turret
//    quick
//    tank
//    nurse
//    shooter
    init(size:CGSize, player1school: Int, player2school: Int, p1first: String, p1second: String, p1third: String, p1fourth: String, p2first: String, p2second: String, p2third: String, p2fourth: String) {
        
        p1firstType = p1first
        p1secondType = p1second
        p1thirdType = p1third
        p1fourthType = p1fourth
        
        p2firstType = p2first
        p2secondType = p2second
        p2thirdType = p2third
        p2fourthType = p2fourth
        
        print(p1first)
        print(p1second)
        print(p1third)
        print(p1fourth)
        
        print(p2first)
        print(p2second)
        print(p2third)
        print(p2fourth)
        
        
        player1schoolstring = String(player1school)
        player2schoolstring = String(player2school)
        
        super.init(size: size)
        
        fireEmmiter?.zPosition = 3
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var player1school: Int!
    var player2school: Int!
    
    // Constants
    
    // Buttons
    
    var p1first: ButtonNode!
    var p1second: ButtonNode!
    var p1third: ButtonNode!
    var p1fourth: ButtonNode!
    
    var p2first: ButtonNode!
    var p2second: ButtonNode!
    var p2third: ButtonNode!
    var p2fourth: ButtonNode!
    

    
    
    var bombButton1, bombButton2: ButtonNode!
    
    var coin1, coin2: SKSpriteNode!
    
    // Labels
    //  let stateLabel = SKLabelNode(fontNamed: "Courier-Bold")
    let coin1Label = SKLabelNode(fontNamed: "Courier-Bold")
    let coin2Label = SKLabelNode(fontNamed: "Courier-Bold")
    
    
    
    // Update time
    var lastUpdateTimeInterval: NSTimeInterval = 0
    let margin = CGFloat(0)
    
    let space1 = CGFloat(565)
    
    let space2 = CGFloat(440)
    
    let space3 = CGFloat(65)
    
    let space4 = CGFloat(-40)
    
    // Game over detection
    var gameOver = false
    
    // Entity-component system
    var entityManager: EntityManager!
   
    //    var closureName: (ParameterTypes) -> (ReturnType)
    var p1firstSpawn: (Team, SKAction)->()  = randomFunction()
    var p1secondSpawn: (Team, SKAction)->() = randomFunction()
    var p1thirdSpawn: (Team, SKAction)->() = randomFunction()
    var p1fourthSpawn: (Team, SKAction)->() = randomFunction()
    
    var p2firstSpawn: (Team, SKAction)->() = randomFunction()
    var p2secondSpawn: (Team, SKAction)->() = randomFunction()
    var p2thirdSpawn: (Team, SKAction)->() = randomFunction()
    var p2fourthSpawn: (Team, SKAction)->() = randomFunction()
    
    
    
    override func didMoveToView(view: SKView) {
        
        entityManager = EntityManager(scene: self, player1schoolString: player1schoolstring, player2schoolString: player2schoolstring)

        
        createAnimations(player1schoolstring, player2: player2schoolstring)

        switch p1firstType {
        case "bomber":
            p1firstSpawn = entityManager.createBomber()
            p1firstAnimation = bomberAni
        case "freezer":
            p1firstSpawn = entityManager.createFreezer()
            p1firstAnimation = freezerAni
        case "money":
            p1firstSpawn = entityManager.createMoney()
            p1firstAnimation = moneyAni
        case "turret":
            p1firstSpawn = entityManager.createTurret()
            p1firstAnimation = turretAni
        case "quick":
            p1firstSpawn = entityManager.createQuick()
            p1firstAnimation = quickAni
        case "tank":
            p1firstSpawn = entityManager.createTank()
            p1firstAnimation = tankAni
        case "nurse":
            p1firstSpawn = entityManager.createNurse()
            p1firstAnimation = nurseAni
        case "shooter":
            p1firstSpawn = entityManager.createShooter()
            p1firstAnimation = shooterAni
        default:
            break
            
        }
        
        switch p1secondType {
        case "bomber":
            p1secondSpawn = entityManager.createBomber()
            p1secondAnimation = bomberAni
        case "freezer":
            p1secondSpawn = entityManager.createFreezer()
            p1secondAnimation = freezerAni
        case "money":
            p1secondSpawn = entityManager.createMoney()
            p1secondAnimation = moneyAni
        case "turret":
            p1secondSpawn = entityManager.createTurret()
            p1secondAnimation = turretAni
        case "quick":
            p1secondSpawn = entityManager.createQuick()
            p1secondAnimation = quickAni
        case "tank":
            p1secondSpawn = entityManager.createTank()
            p1secondAnimation = tankAni
        case "nurse":
            p1secondSpawn = entityManager.createNurse()
            p1secondAnimation = nurseAni
        case "shooter":
            p1secondSpawn = entityManager.createShooter()
            p1secondAnimation = shooterAni
        default:
            break
            
        }

        switch p1thirdType {
        case "bomber":
            p1thirdSpawn = entityManager.createBomber()
            p1thirdAnimation = bomberAni
        case "freezer":
            p1thirdSpawn = entityManager.createFreezer()
            p1thirdAnimation = freezerAni
        case "money":
            p1thirdSpawn = entityManager.createMoney()
            p1thirdAnimation = moneyAni
        case "turret":
            p1thirdSpawn = entityManager.createTurret()
            p1thirdAnimation = turretAni
        case "quick":
            p1thirdSpawn = entityManager.createQuick()
            p1thirdAnimation = quickAni
        case "tank":
            p1thirdSpawn = entityManager.createTank()
            p1thirdAnimation = tankAni
        case "nurse":
            p1thirdSpawn = entityManager.createNurse()
            p1thirdAnimation = nurseAni
        case "shooter":
            p1thirdSpawn = entityManager.createShooter()
            p1thirdAnimation = shooterAni
        default:
            break
            
        }

        switch p1fourthType {
        case "bomber":
            p1fourthSpawn = entityManager.createBomber()
            p1fourthAnimation = bomberAni
        case "freezer":
            p1fourthSpawn = entityManager.createFreezer()
            p1fourthAnimation = freezerAni
        case "money":
            p1fourthSpawn = entityManager.createMoney()
            p1fourthAnimation = moneyAni
        case "turret":
            p1fourthSpawn = entityManager.createTurret()
            p1fourthAnimation = turretAni
        case "quick":
            p1fourthSpawn = entityManager.createQuick()
            p1fourthAnimation = quickAni
        case "tank":
            p1fourthSpawn = entityManager.createTank()
            p1fourthAnimation = tankAni
        case "nurse":
            p1fourthSpawn = entityManager.createNurse()
            p1fourthAnimation = nurseAni
        case "shooter":
            p1fourthSpawn = entityManager.createShooter()
            p1fourthAnimation = shooterAni
        default:
            break
            
        }

        switch p2firstType {
        case "bomber":
            p2firstSpawn = entityManager.createBomber()
            p2firstAnimation = bomberAni
        case "freezer":
            p2firstSpawn = entityManager.createFreezer()
            p2firstAnimation = freezerAni
        case "money":
            p2firstSpawn = entityManager.createMoney()
            p2firstAnimation = moneyAni
        case "turret":
            p2firstSpawn = entityManager.createTurret()
            p2firstAnimation = turretAni
        case "quick":
            p2firstSpawn = entityManager.createQuick()
            p2firstAnimation = quickAni
        case "tank":
            p2firstSpawn = entityManager.createTank()
            p2firstAnimation = tankAni
        case "nurse":
            p2firstSpawn = entityManager.createNurse()
            p2firstAnimation = nurseAni
        case "shooter":
            p2firstSpawn = entityManager.createShooter()
            p2firstAnimation = shooterAni
        default:
            break
            
        }
        
        switch p2secondType {
        case "bomber":
            p2secondSpawn = entityManager.createBomber()
            p2secondAnimation = bomberAni
        case "freezer":
            p2secondSpawn = entityManager.createFreezer()
               p2secondAnimation = freezerAni
        case "money":
            p2secondSpawn = entityManager.createMoney()
               p2secondAnimation = moneyAni
        case "turret":
            p2secondSpawn = entityManager.createTurret()
               p2secondAnimation = turretAni
        case "quick":
            p2secondSpawn = entityManager.createQuick()
               p2secondAnimation = quickAni
        case "tank":
            p2secondSpawn = entityManager.createTank()
               p2secondAnimation = tankAni
        case "nurse":
            p2secondSpawn = entityManager.createNurse()
               p2secondAnimation = nurseAni
        case "shooter":
            p2secondSpawn = entityManager.createShooter()
               p2secondAnimation = shooterAni
        default:
            break
            
        }
        
        switch p2thirdType {
        case "bomber":
            p2thirdSpawn = entityManager.createBomber()
            p2thirdAnimation = bomberAni
        case "freezer":
            p2thirdSpawn = entityManager.createFreezer()
            p2thirdAnimation = freezerAni
        case "money":
            p2thirdSpawn = entityManager.createMoney()
            p2thirdAnimation = moneyAni
        case "turret":
            p2thirdSpawn = entityManager.createTurret()
            p2thirdAnimation = turretAni
        case "quick":
            p2thirdSpawn = entityManager.createQuick()
            p2thirdAnimation = quickAni
        case "tank":
            p2thirdSpawn = entityManager.createTank()
            p2thirdAnimation = tankAni
        case "nurse":
            p2thirdSpawn = entityManager.createNurse()
            p2thirdAnimation = nurseAni
        case "shooter":
            p2thirdSpawn = entityManager.createShooter()
            p2thirdAnimation = shooterAni
        default:
            break
            
        }
        
        switch p2fourthType {
        case "bomber":
            p2fourthSpawn = entityManager.createBomber()
            p2fourthAnimation = bomberAni
        case "freezer":
            p2fourthSpawn = entityManager.createFreezer()
            p2fourthAnimation = freezerAni
        case "money":
            p2fourthSpawn = entityManager.createMoney()
            p2fourthAnimation = moneyAni
        case "turret":
            p2fourthSpawn = entityManager.createTurret()
            p2fourthAnimation = turretAni
        case "quick":
            p2fourthSpawn = entityManager.createQuick()
            p2fourthAnimation = quickAni
        case "tank":
            p2fourthSpawn = entityManager.createTank()
            p2fourthAnimation = tankAni
        case "nurse":
            p2fourthSpawn = entityManager.createNurse()
            p2fourthAnimation = nurseAni
        case "shooter":
            p2fourthSpawn = entityManager.createShooter()
            p2fourthAnimation = shooterAni
        default:
            break
            
        }
        
        self.runAction(SKAction.playSoundFileNamed("stuck.mp3", waitForCompletion: false))
        
        print("team1")
        print(player1schoolstring)
        print("team2")
        print(player2schoolstring)
        
        
        
        //Berkeley(1), Davis (2), Irvine (3), LA (4), Merced (5), Riverside (6), San Diego (7), Santa Barbara (8), Santa Cruz (9)
        
        
        
        print("scene size: \(size)")
        
        
        
        
        
        let background = SKSpriteNode(imageNamed: "trollbackground")
        
        background.position = CGPoint(x:self.frame.size.width/2, y:self.frame.size.height/2)
        
        background.size = CGSize(width:self.size.width, height:self.size.height)
        background.zPosition = -1
        
        addChild(background)
        
        
        
        // Add bomb button
        bombButton1 = ButtonNode(iconName: "bombButton", text: "HIIII", onButtonPress: bombPressed())
        bombButton1.position = CGPoint(x: size.width * 0.32, y: margin + bombButton1.size.height * 1/4 + 10)
        bombButton1.zPosition = 99
        addChild(bombButton1)

        
        bombButton2 = ButtonNode(iconName: "bombButton", text: "", onButtonPress: bombPressed1())
        bombButton2.position = CGPoint(x: size.width * 0.68, y: margin  + bombButton2.size.height * 1/4 + 10)
        bombButton2.zPosition = 99
        addChild(bombButton2)
        
        
        // Add Nurse button
        
        p1first = ButtonNode(iconName: "nurseButton", text: "", onButtonPress: p1firstSpawn(.Team1, p1firstAnimation))
        p1first.position = CGPoint(x: size.width * 0.22, y: margin + space2 + p1first.size.height * 3.9/4 - 80)
        p1first.zPosition = 99
        addChild(p1first)
        
        
         p1second = ButtonNode(iconName: player1schoolstring + "quirkButton", text: "", onButtonPress: p1secondSpawn(.Team1, p1secondAnimation))
        p1second.position = CGPoint(x: size.width * 0.10, y: margin + space2 + p1second.size.height * 2/4 - 20)
        p1second.zPosition = 99
        addChild(p1second)
        
        
        p1third = ButtonNode(iconName: player1schoolstring + "zapButton", text: "25", onButtonPress: p1thirdSpawn(.Team1, p1thirdAnimation))
        p1third.position = CGPoint(x: size.width * 0.10, y: margin + space3 + p1third.size.height * 4/4 - 125)
        p1third.zPosition = 99
        addChild(p1third)

        
        p1fourth = ButtonNode(iconName: player1schoolstring + "munchButton", text: "50", onButtonPress: p1fourthSpawn(.Team1, p1fourthAnimation))
        p1fourth.position = CGPoint(x: size.width * 0.22, y: margin + space4 + p1fourth.size.height - 80)
        p1fourth.zPosition = 99
        addChild(p1fourth)
        

        
        p2first = ButtonNode(iconName: "nurseButton", text: "", onButtonPress: p2firstSpawn(.Team2, p2firstAnimation))
        p2first.position = CGPoint(x: size.width * 0.78, y: margin + space2 + p2first.size.height * 3.9/4 - 80)
        p2first.zPosition = 99
        addChild(p2first)
        
        
        // Add quirk button
        
       
        
        
        p2second = ButtonNode(iconName: player2schoolstring + "quirkButton", text: "", onButtonPress: p2secondSpawn(.Team2, p2secondAnimation))
        p2second.position = CGPoint(x: size.width * 0.90, y: margin + space2 + p2second.size.height * 2/4 - 20)
        p2second.zPosition = 99
        
        addChild(p2second)
        
        // Add zap button
        
               p2third = ButtonNode(iconName: player2schoolstring + "zapButton", text: "25", onButtonPress: p2thirdSpawn(.Team2, p2thirdAnimation))
        
        p2third.position = CGPoint(x: size.width * 0.90, y: margin + space3 + p2third.size.height * 4/4 - 125)
        p2third.zPosition = 99
        addChild(p2third)
        
        
        // Add munch button
        
        
        p2fourth = ButtonNode(iconName: player2schoolstring + "munchButton", text: "50", onButtonPress: p2fourthSpawn(.Team2, p2fourthAnimation))
        p2fourth.position = CGPoint(x: size.width * 0.78, y: margin + space4 + p2fourth.size.height - 80)
        p2fourth.zPosition = 99
        addChild(p2fourth)
        
        
        
        // Add coin 1 indicator
        coin1 = SKSpriteNode(imageNamed: "coin")
        coin1.position = CGPoint(x: margin + coin1.size.width/2 + space1, y: size.height - margin - coin1.size.height/2)
        coin1.name = "coin1"
        addChild(coin1)
        coin1Label.fontSize = 50
        coin1Label.fontColor = SKColor.whiteColor()
        coin1Label.position = CGPoint(x: coin1.position.x + coin1.size.width/2 + margin, y: coin1.position.y)
        coin1Label.zPosition = 99
        coin1Label.horizontalAlignmentMode = .Left
        coin1Label.verticalAlignmentMode = .Center
        coin1Label.text = "200"
        self.addChild(coin1Label)
        
        // Add coin 2 indicator
        coin2 = SKSpriteNode(imageNamed: "coin")
        coin2.position = CGPoint(x: size.width - margin - coin1.size.width/2 - space1, y: size.height - margin - coin1.size.height/2)
        coin2.name = "coin2"
        addChild(coin2)
        coin2Label.fontSize = 50
        coin2Label.fontColor = SKColor.whiteColor()
        coin2Label.position = CGPoint(x: coin2.position.x - coin2.size.width/2 - margin, y: coin1.position.y)
        coin2Label.zPosition = 99
        coin2Label.horizontalAlignmentMode = .Right
        coin2Label.verticalAlignmentMode = .Center
        coin2Label.text = "200"
        self.addChild(coin2Label)
        
        // Add castles
        let player1 = Castle(imageName: player1schoolstring + "1castle", team: .Team1, entityManager: entityManager, school: "1")
        if let spriteComponent = player1.componentForClass(SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: spriteComponent.node.size.width/2, y: size.height/2 + 75)
        }
        entityManager.add(player1)
        let player2Castle = Castle(imageName: player2schoolstring + "2castle", team: .Team2, entityManager: entityManager, school: "2")
        if let spriteComponent = player2Castle.componentForClass(SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: size.width - spriteComponent.node.size.width/2, y: size.height/2 + 75)
        }
        entityManager.add(player2Castle)
        
        
    }
    
    var team1bomb = true
    var team2bomb = true
    
    func bombPressed() {
//        bombButton1.changeIcon("greyButton")
//        
//        if team1bomb == true {
//            print("Bomb!!")
//            entityManager.bombAll()
//            team1bomb = false
//        }
    }
    
    func bombPressed1() {
//        bombButton2.changeIcon("greyButton")
//        if team2bomb == true {
//            print("Bomb!!")
//            entityManager.bombAll()
//            team2bomb = false
//        }
        
    }
    
//    func nursePressed1() {
//        print("Quirk pressed!")
//        entityManager.spawnNurse(.Team1)
//    }
//    
//    func nursePressed2() {
//        print("Quirk pressed!")
//        entityManager.spawnNurse(.Team2)
//    }
//    
//    func quirkPressed1() {
//        print("Quirk pressed!")
//        entityManager.spawnQuirk(.Team1, disneyAnimation: quickAni)
//    }
//    
//    func quirkPressed2() {
//        print("Quirk pressed!")
//        entityManager.spawnQuirk(.Team2, disneyAnimation: quickAni)
//    }
//    
//    func zapPressed1() {
//        print("Zap pressed!")
//        entityManager.spawnZap(.Team1, disneyAnimation: shooterAni)
//    }
//    
//    func zapPressed2() {
//        print("Zap pressed!")
//        entityManager.spawnZap(.Team2, disneyAnimation: shooterAni)
//    }
//    
//    func munchPressed1() {
//        print("Munch pressed!")
//        entityManager.spawnMunch(.Team1, disneyAnimation: tankAni)
//    }
//    
//    func munchPressed2() {
//        print("Munch pressed!")
//        entityManager.spawnMunch(.Team2, disneyAnimation: tankAni)
//    }
    
    func makePopUpComeUp() {
        
        didPopUp = true
        
//        rectangle = SKShapeNode(rect: CGRectMake(0, 0, self.frame.width, self.frame.height))
//        rectangle.zPosition = 1000
//        rectangle.fillColor = UIColor.blackColor()
//        rectangle.hidden = false
//        addChild(rectangle)
//        
//        
//        popUpView = SKSpriteNode(imageNamed: "berkeley")
//        popUpView.zPosition = 100
//        popUpView.hidden = false;
//        print("troll")
//        popUpView.position = CGPoint(x: frame.size.width * 0.32, y: frame.size.height * 0.32)
//        popUpView.size = CGSize(width: frame.width * 0.4, height: frame.height*0.4)
//        addChild(popUpView)

        print("created shit")
//        self.popUpView.hidden = false
//        popUpView.zPosition = 100
//        self.rectangle.hidden = false
//        rectangle.zPosition = 1000
        
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
        for touch in (touches ) {
            let location = touch.locationInNode(self)
            let nodeTouched = nodeAtPoint(location)
            
            if self.coin1.containsPoint(location) || self.coin2.containsPoint(location) {
                
                if(self.view?.paused == false)
                {
                    
                    makePopUpComeUp()
                    print("game scene paused")
                   

                    self.view?.paused = true
                  //  self.view!.alpha = 0.5
                }
                
            }
            // Check for HUD buttons:
            if nodeTouched.name == "restartGame" {
                
                let aspectRatio = view!.bounds.size.width / view!.bounds.size.height
                //
                let intro = IntroScene(size: CGSize(width: 640 * aspectRatio, height: 640), playbutton: "background2", background: "background1" )
                
                
                self.view?.presentScene(intro)
                
            }
        }
    }
    var message: String = "You Win!"
    
    var restartButton = SKSpriteNode(imageNamed: "restart.png")
    
    
    
    func showRestartMenu(won: Bool) {
        restartButton.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        restartButton.position = CGPointMake(self.size.width/2, self.size.height/2.5 - 152)
        restartButton.name = "restartGame"
        restartButton.zPosition = 100
        self.addChild(restartButton)
        /*
        berkeley = SKSpriteNode(imageNamed: "berkeley")
        var berkeley: SKSpriteNode!
        berkeley.size = CGSize(width:self.size.width*0.25, height:self.size.height*0.40)
        berkeley.position = CGPointMake(self.size.width/6, self.size.height/2)
        berkeley.zPosition = 1
        addChild(berkeley)
        */
        
        // Berkeley(1), Davis (2), Irvine (3), LA (4), Merced (5), Riverside (6), San Diego (7), Santa Barbara (8), Santa Cruz (9)
        
        gameOver = true
        if won {
            print(player1schoolstring)
            if player1schoolstring == "1" {
                message = "Berkeley won!"
                
            }
            if player1schoolstring == "2" {
                message = "Davis won!"
            }
            if player1schoolstring == "3" {
                message = "Irvine won!"
            }
            if player1schoolstring == "4" {
                message = "LA won!"
            }
            if player1schoolstring == "5" {
                message = "Merced won!"
            }
            if player1schoolstring == "6" {
                message = "Riverside won!"
            }
            if player1schoolstring == "7" {
                message = "San Diego won!"
            }
            if player1schoolstring == "8" {
                message = "SantaBarbara won!"
            }
            if player1schoolstring == "9" {
                message = "Santa Cruz won!"
            }
            if player1schoolstring == "10" {
                message = "usc lost! they cheated"
            }
            
            
            
            
        } else
        {
            if player2schoolstring == "1" {
                message = "Berkeley won!"
                
            }
            if player2schoolstring == "2" {
                message = "Davis won!"
            }
            if player2schoolstring == "3" {
                message = "Irvine won!"
            }
            if player2schoolstring == "4" {
                message = "LA won!"
            }
            if player2schoolstring == "5" {
                message = "Merced won!"
            }
            if player2schoolstring == "6" {
                message = "Riverside won!"
            }
            if player2schoolstring == "7" {
                message = "San Diego won!"
            }
            if player2schoolstring == "8" {
                message = "SantaBarbara won!"
            }
            if player2schoolstring == "9" {
                message = "Santa Cruz won!"
            }
            if player2schoolstring == "10" {
                message = "usc lost! they cheated"
            }
            
        }        // player1schoolstring
        
        
        
        let label = SKLabelNode(fontNamed: "Courier-Bold")
        label.fontSize = 100
        label.fontColor = SKColor.whiteColor()
        label.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        label.zPosition = 99
        label.verticalAlignmentMode = .Center
        label.text = message
        label.setScale(0)
        addChild(label)
        
        let scaleAction = SKAction.scaleTo(1.0, duration: 0.5)
        scaleAction.timingMode = SKActionTimingMode.EaseInEaseOut
        label.runAction(scaleAction)
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        let deltaTime = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        
        if didPopUp == true {
            rectangle = SKShapeNode(rect: CGRectMake(0, 0, self.frame.width, self.frame.height))
            rectangle.zPosition = 1000
            rectangle.fillColor = UIColor.blackColor()
            rectangle.hidden = false
            addChild(rectangle)
            
            
            popUpView = SKSpriteNode(imageNamed: "berkeley")
            popUpView.zPosition = 100
            popUpView.hidden = false
            print("troll")
            popUpView.position = CGPoint(x: frame.size.width * 0.32, y: frame.size.height * 0.32)
            popUpView.size = CGSize(width: frame.width * 0.4, height: frame.height*0.4)
            addChild(popUpView)

        }
        
        if gameOver {
            return
        }
        
        entityManager.update(deltaTime)
        
        // Check for game over
        if let player1 = entityManager.castleForTeam(.Team1),
            player1Castle = player1.componentForClass(CastleComponent.self),
            player1Health = player1.componentForClass(HealthComponent.self) {
                if (player1Health.health <= 0) {
                    showRestartMenu(false)
                }
                coin2Label.text = "\(player1Castle.coins)"
        }
        if let player2 = entityManager.castleForTeam(.Team2),
            player2Castle = player2.componentForClass(CastleComponent.self),
            player2Health = player2.componentForClass(HealthComponent.self) {
                if (player2Health.health <= 0) {
                    showRestartMenu(true)
                }
                coin1Label.text = "\(player2Castle.coins)"
        }
        
    }
    
    
    var creaturesAtlas:SKTextureAtlas = SKTextureAtlas(named:"collection.atlas")
    
    func createAnimations(player1: String, player2: String) {
        
        
        let munchFrames:[SKTexture] = [
            creaturesAtlas.textureNamed(player1 + "1" + "munch" + "1.png"),
            creaturesAtlas.textureNamed(player1 + "1" + "munch" + "2.png"),
            creaturesAtlas.textureNamed(player1 + "1" + "munch" + "3.png"),
            
        ]
        let munchIteration = SKAction.animateWithTextures(munchFrames, timePerFrame: 0.20)
        tankAni = SKAction.repeatActionForever(munchIteration)
        
        
        let zapFrames: [SKTexture] = [
            creaturesAtlas.textureNamed(player1 + "1" + "zap" + "1.png"),
            creaturesAtlas.textureNamed(player1 + "1" + "zap" + "2.png"),
            creaturesAtlas.textureNamed(player1 + "1" + "zap" + "3.png"),
        ]
        let zapIteration = SKAction.animateWithTextures(zapFrames, timePerFrame: 0.20)
        shooterAni = SKAction.repeatActionForever(zapIteration)
        
        
        let quirkFrames: [SKTexture] = [
            creaturesAtlas.textureNamed(player1 + "1" + "quirk" + "1.png"),
            creaturesAtlas.textureNamed(player1 + "1" + "quirk" + "2.png"),
            creaturesAtlas.textureNamed(player1 + "1" + "quirk" + "3.png"),
        ]
        let quirkIteration = SKAction.animateWithTextures(quirkFrames, timePerFrame: 0.20)
        quickAni = SKAction.repeatActionForever(quirkIteration)
        
//        
//        let munchFrames2:[SKTexture] = [
//            creaturesAtlas.textureNamed(player2 + "2" + "munch" + "1.png"),
//            creaturesAtlas.textureNamed(player2 + "2" + "munch" + "2.png"),
//            creaturesAtlas.textureNamed(player2 + "2" + "munch" + "3.png"),
//            
//        ]
//        let munchIteration2 = SKAction.animateWithTextures(munchFrames2, timePerFrame: 0.20)
//        munchAniTeam2 = SKAction.repeatActionForever(munchIteration2)
//        
//        
//        let zapFrames2: [SKTexture] = [
//            creaturesAtlas.textureNamed(player2 + "2" + "zap" + "1.png"),
//            creaturesAtlas.textureNamed(player2 + "2" + "zap" + "2.png"),
//            creaturesAtlas.textureNamed(player2 + "2" + "zap" + "3.png"),
//        ]
//        let zapIteration2 = SKAction.animateWithTextures(zapFrames2, timePerFrame: 0.20)
//        zapAniTeam2 = SKAction.repeatActionForever(zapIteration2)
//        
//        
//        let quirkFrames2: [SKTexture] = [
//            creaturesAtlas.textureNamed(player2 + "2" + "quirk" + "1.png"),
//            creaturesAtlas.textureNamed(player2 + "2" + "quirk" + "2.png"),
//            creaturesAtlas.textureNamed(player2 + "2" + "quirk" + "3.png"),
//        ]
//        let quirkIteration2 = SKAction.animateWithTextures(quirkFrames2, timePerFrame: 0.20)
//        quirkAniTeam2 = SKAction.repeatActionForever(quirkIteration2)
//        
        
    }
    
}
