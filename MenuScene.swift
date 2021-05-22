//
//  MenuScene.swift
//  Horse Racing
//
//  Created by Masood Zafar on 29.04.2021.
//

import SpriteKit

class MenuScene: SKScene {
    
    //Grab the HUD sprite atlas:
    let textureAtlas: SKTextureAtlas = SKTextureAtlas(named:"Menu")
    
    //Instantiate a sprite node for the start button and horses
    let startButton = SKSpriteNode()
    let horseRed = SKSpriteNode()
    let horseGreen = SKSpriteNode()
    let horseBlue = SKSpriteNode()
    
    //Sounds
    let click = SKAction.playSoundFileNamed("Sound/click.aif", waitForCompletion: false)
    let error = SKAction.playSoundFileNamed("Sound/error.aif", waitForCompletion: false)
    
    //Instruction
    let instructText = SKLabelNode(fontNamed: "AvenirNext-Regular")
    
    static var horsePicked = ""
    
    
    override func didMove(to view: SKView){
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.88, alpha: 1.00)
        
        //Title of the game
        let logoText = SKLabelNode(fontNamed: "AvenirNext-Heavy")
        logoText.text = "Horsetrian"
        logoText.fontColor = UIColor(red: 0.00, green: 0.38, blue: 0.66, alpha: 1.00)
        logoText.position = CGPoint(x: 0, y: 100)
        logoText.fontSize = 60
        
        //Instruction
        instructText.text = "Please select your horse"
        instructText.fontColor = UIColor(red: 0.00, green: 0.38, blue: 0.66, alpha: 1.00)
        instructText.position = CGPoint(x: 0, y: 50)
        instructText.fontSize = 20
        
        //Start game button and text
        startButton.texture = textureAtlas.textureNamed("button")
        startButton.size = CGSize(width: 295, height: 75)
        startButton.name = "StartBtn"
        startButton.position = CGPoint(x: 0, y: -110)
        let startBtnTxt = SKLabelNode(fontNamed: "AvenirNext-HeavyItalic")
        startBtnTxt.text = "START"
        startBtnTxt.verticalAlignmentMode = .center
        startBtnTxt.position = CGPoint(x: 0, y: -103)
        startBtnTxt.fontSize = 40
        startBtnTxt.name = "StartBtn"
        startBtnTxt.zPosition = 5
        
        // Giving the start text a pulse
        let pulseAction = SKAction.sequence([SKAction.fadeAlpha(to: 0.5, duration: 0.9),SKAction.fadeAlpha(to: 1, duration: 0.9)])
        startBtnTxt.run(SKAction.repeatForever(pulseAction))
        
        //Horses on the screen
        horseRed.texture = textureAtlas.textureNamed("HorseRed")
        horseRed.size = CGSize(width: 50, height: 50)
        horseRed.name = "HorseRed"
        horseRed.position = CGPoint(x: -100, y: -10)

        horseGreen.texture = textureAtlas.textureNamed("HorseGreen")
        horseGreen.size = CGSize(width: 50, height: 50)
        horseGreen.name = "HorseGreen"
        horseGreen.position = CGPoint(x: 0, y: -10)
        
        horseBlue.texture = textureAtlas.textureNamed("HorseBlue")
        horseBlue.size = CGSize(width: 50, height: 50)
        horseBlue.name = "HorseBlue"
        horseBlue.position = CGPoint(x: 100, y: -10)
        
        self.addChild(logoText)
        self.addChild(instructText)
        self.addChild(startButton)
        self.addChild(startBtnTxt)
        self.addChild(horseRed)
        self.addChild(horseGreen)
        self.addChild(horseBlue)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches) {
            // Find the location of the touch:
            let location = touch.location(in: self)
            // Locate the node at this location:
            let nodeTouched = atPoint(location)
            
            let horseScale = SKAction.sequence([SKAction.scale(to: CGSize(width: 60, height: 60), duration: 0.5),
                                                SKAction.scale(to: CGSize(width: 50, height: 50), duration: 0.5)])
            
            instructText.fontColor = UIColor(red: 0.00, green: 0.38, blue: 0.66, alpha: 1.00)
            
            
            switch nodeTouched.name {
            
            
            
            case "StartBtn":
                if (MenuScene.horsePicked.isEmpty)
                {
                    self.run(error)
                    instructText.fontColor = UIColor(red: 0.81, green: 0.00, blue: 0.00, alpha: 1.00)
                    horseRed.run(horseScale)
                    horseGreen.run(horseScale)
                    horseBlue.run(horseScale)
                }
                else
                {
                    self.view?.presentScene(GameScene(size: self.size))
                }
                
            case "HorseRed":
                self.run(click)
                MenuScene.horsePicked = nodeTouched.name!
                
            case "HorseGreen":
                self.run(click)
                MenuScene.horsePicked = nodeTouched.name!
                
            case "HorseBlue":
                self.run(click)
                MenuScene.horsePicked = nodeTouched.name!
                
            default:
                self.run(error)
                instructText.fontColor = UIColor(red: 0.81, green: 0.00, blue: 0.00, alpha: 1.00)
                horseRed.run(horseScale)
                horseGreen.run(horseScale)
                horseBlue.run(horseScale)
            }
                
        }
    }
    
}
