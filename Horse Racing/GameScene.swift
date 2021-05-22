//
//  GameScene.swift
//  Horse Racing
//
//  Created by Masood Zafar on 18.03.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //Instantiating factory class
    let factory = HorseFactory()
    
    //Creating horse objects with factory class
    lazy var horse1 = factory.create(.red)
    lazy var horse2 = factory.create(.green)
    lazy var horse3 = factory.create(.blue)
    
    override func didMove(to view: SKView)
    {
        //adding the track on the screen
        let trackNode = SKSpriteNode(imageNamed: "Track")
        trackNode.size = CGSize(width: 600, height: 250)
        trackNode.position = CGPoint(x: frame.midX, y: frame.midY)
        
        //Displaying the name of the horse choosen
        let displayName = display(horseName: MenuScene.horsePicked)
        //Defining horses' positions on screen
        horse1.position = CGPoint(x: frame.midX-250, y: frame.midY-80)
        horse2.position = CGPoint(x: frame.midX-250, y: frame.midY-80)
        horse3.position = CGPoint(x: frame.midX-250, y: frame.midY-80)
        
        self.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.88, alpha: 1.00)
        self.addChild(displayName)
        self.addChild(trackNode)
        self.addChild(horse1 as! SKNode)
        self.addChild(horse2 as! SKNode)
        self.addChild(horse3 as! SKNode)
        
        let seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            
            self.horse1.horseRace(T1: TimeInterval(Int.random(in: 5..<10)),
                  T2: TimeInterval(Int.random(in: 5..<10)),
                  T3: TimeInterval(Int.random(in: 5..<10)),
                  T4: TimeInterval(Int.random(in: 5..<10)),
                  T5: TimeInterval(Int.random(in: 1..<2)),
                  Tx: TimeInterval(Int.random(in: 3..<4)),
                  T: "HR")
            
            self.horse2.horseRace(T1: TimeInterval(Int.random(in: 5..<10)),
                  T2: TimeInterval(Int.random(in: 5..<10)),
                  T3: TimeInterval(Int.random(in: 5..<10)),
                  T4: TimeInterval(Int.random(in: 5..<10)),
                  T5: TimeInterval(Int.random(in: 1..<2)),
                  Tx: TimeInterval(Int.random(in: 3..<4)),
                  T: "HG")
            
            self.horse3.horseRace(T1: TimeInterval(Int.random(in: 5..<10)),
                  T2: TimeInterval(Int.random(in: 5..<10)),
                  T3: TimeInterval(Int.random(in: 5..<10)),
                  T4: TimeInterval(Int.random(in: 5..<10)),
                  T5: TimeInterval(Int.random(in: 1..<2)),
                  Tx: TimeInterval(Int.random(in: 3..<4)),
                  T: "HB")
        }
    }
    
    //function to display the horsepicked on GameScene
    func display(horseName: String)->SKLabelNode
    {
        let displayName = SKLabelNode(fontNamed: "AvenirNext-Regular")
        displayName.text = "You: " + horseName
        displayName.position = CGPoint(x: frame.midX, y: frame.minY+25)
        displayName.fontSize = 20
        
        if(horseName == "HorseRed")
        {
            displayName.fontColor = UIColor(red: 0.81, green: 0.00, blue: 0.00, alpha: 1.00)
        }
        else if(horseName == "HorseGreen")
        {
            displayName.fontColor = UIColor(red: 0.02, green: 0.27, blue: 0.13, alpha: 1.00)
        }
        else if(horseName == "HorseBlue")
        {
            displayName.fontColor = UIColor(red: 0.00, green: 0.00, blue: 1.00, alpha: 1.00)
        }
        
        return displayName
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        let seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            
            //Logic of the game for determining winner or loser
            
            /*
             * Checks on every inteval, if the horse choosen doesn't have any actions.
             * Then we check if the name matches with the type choosen in the menu scene.
             * If the conditions are met then we transition to the Won scene else we transition to the lost scene.
             */
            
            if ( (!self.horse1.check()) && (MenuScene.horsePicked == "HorseRed") )
            {
                self.view?.presentScene(WonScene(size: self.size))
            }
            else if ( (!self.horse2.check()) && (MenuScene.horsePicked == "HorseGreen") )
            {
                self.view?.presentScene(WonScene(size: self.size))
            }
            else if ( (!self.horse3.check()) && (MenuScene.horsePicked == "HorseBlue") )
            {
                self.view?.presentScene(WonScene(size: self.size))
            }
            else
            {
                if( (!self.horse1.check()) )
                {
                    self.view?.presentScene(LostScene(size: self.size))
                }
                else if( (!self.horse2.check()) )
                {
                    self.view?.presentScene(LostScene(size: self.size))
                }
                else if( (!self.horse3.check()) )
                {
                    self.view?.presentScene(LostScene(size: self.size))
                }
            }
        }
    }
}
