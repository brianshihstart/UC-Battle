    //
    //  ButtonNode.swift
    //  MonsterWars
    //
    //  Created by Main Account on 11/3/15.
    //  Copyright © 2015 Razeware LLC. All rights reserved.
    //
    
    import Foundation
    import SpriteKit
    
    class ButtonNode : SKSpriteNode {
        // greyButton
        let onButtonPress: ()
        
        init(iconName: String, text: String, onButtonPress: ()) {
            
            self.onButtonPress = onButtonPress
            
            let texture = SKTexture(imageNamed: "nurseButton")
            super.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
            
            let icon = SKSpriteNode(imageNamed: iconName)
            icon.position = CGPoint(x: -size.width * 0.0, y: 0)
            icon.zPosition = 1
            self.addChild(icon)
            
            let label = SKLabelNode(fontNamed: "Courier-Bold")
            label.fontSize = 50
            label.fontColor = SKColor.blackColor()
            label.position = CGPoint(x: size.width * 0.25, y: 0)
            label.zPosition = 1
            label.verticalAlignmentMode = .Center
            label.text = text
            //self.addChild(label)
            
            userInteractionEnabled = true
            
        }
        
        func changeIcon(iconName: String) {
            let icon = SKSpriteNode(imageNamed: iconName)
            icon.position = CGPoint(x: -size.width * 0.0, y: 0)
            icon.zPosition = 2
            self.addChild(icon)
        }
        
        override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            onButtonPress
            print("TOUHEDME")
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
