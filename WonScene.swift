//
//  RestartScene.swift
//  Horse Racing
//
//  Created by Masood Zafar on 29.04.2021.
//

import SpriteKit

class WonScene: SKScene {
    
    //Grab the HUD sprite atlas:
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named:"Menu")
    
    //Instantiate a sprite node for the start button and horses
    let restartButton = SKSpriteNode()
    let menuButton = SKSpriteNode()
    let winText = SKLabelNode(fontNamed: "AvenirNext-Heavy")
    let instructText = SKLabelNode(fontNamed: "AvenirNext-Regular")
    
    //Sound
    let click = SKAction.playSoundFileNamed("Sound/click.aif", waitForCompletion: false)
    
    
    override func didMove(to view: SKView){
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.88, alpha: 1.00)
        
        //Title of the game
        winText.text = "You are the Winner!"
        winText.fontColor = UIColor(red: 0.00, green: 0.38, blue: 0.66, alpha: 1.00)
        winText.position = CGPoint(x: 0, y: 100)
        winText.fontSize = 60
        
        //Instruction
        let instructText = SKLabelNode(fontNamed: "AvenirNext-Regular")
        instructText.text = "You can choose to restart or go back to main menu"
        instructText.fontColor = UIColor(red: 0.00, green: 0.38, blue: 0.66, alpha: 1.00)
        instructText.position = CGPoint(x: 0, y: 50)
        instructText.fontSize = 30
        
        //Restart game button
        restartButton.texture = textureAtlas.textureNamed("button-restart")
        restartButton.size = CGSize(width: 100, height: 100)
        restartButton.name = "RestartBtn"
        restartButton.position = CGPoint(x: -100, y: -50)
        
        //Menu game button
        menuButton.texture = textureAtlas.textureNamed("button-menu")
        menuButton.size = CGSize(width: 100, height: 100)
        menuButton.name = "MenuBtn"
        menuButton.position = CGPoint(x: 100, y: -50)

        
        // Giving the winText a pulse
        let pulseAction = SKAction.sequence([SKAction.fadeAlpha(to: 0.5, duration: 0.9),SKAction.fadeAlpha(to: 1, duration: 0.9)])
        winText.run(SKAction.repeatForever(pulseAction))
        
        
        
        self.addChild(winText)
        self.addChild(instructText)
        self.addChild(restartButton)
        self.addChild(menuButton)

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches) {
            // Find the location of the touch:
            let location = touch.location(in: self)
            // Locate the node at this location:
            let nodeTouched = atPoint(location)
            
            switch nodeTouched.name {
                
            case "RestartBtn":
                self.run(click)
                self.view?.presentScene(GameScene(size: self.size))
                
            case "MenuBtn":
                self.run(click)
                self.view?.presentScene(MenuScene(size: self.size))
                
            default:
                break
            }
                
        }
    }
    
}

