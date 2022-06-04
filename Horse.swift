//
//  Horse.swift
//  Horse Racing
//
//  Created by Masood Zafar on 13.05.2021.
//

import SpriteKit

class Horse: SKSpriteNode, Animal {
  
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "HorseRed")
    var initialSize: CGSize = CGSize(width: 45, height: 45)
    var animation: SKAction = SKAction()
    
    //initilization
    init(horseType: String)
    {
        super.init(texture: nil, color: .clear, size: initialSize)
        
        if(horseType == "Red")
        {
            textureAtlas = SKTextureAtlas(named: "HorseRed")
            self.texture = textureAtlas.textureNamed("HR1")
        }
        else if(horseType == "Green")
        {
            textureAtlas = SKTextureAtlas(named: "HorseGreen")
            self.texture = textureAtlas.textureNamed("HG1")
        }
        else if(horseType == "Blue")
        {
            textureAtlas = SKTextureAtlas(named: "HorseBlue")
            self.texture = textureAtlas.textureNamed("HB1")
        }
    }
    
    //required initializer in case of error
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //function to call when the horse is running
    func runningAnimation(type: String)
    {
        let horseFrames: [SKTexture] = [textureAtlas.textureNamed(type+"1"),
                                        textureAtlas.textureNamed(type+"2"),
                                        textureAtlas.textureNamed(type+"3"),
                                        textureAtlas.textureNamed(type+"4"),
                                        textureAtlas.textureNamed(type+"5"),
                                        textureAtlas.textureNamed(type+"6"),
                                        textureAtlas.textureNamed(type+"7"),
                                        textureAtlas.textureNamed(type+"8"),
                                        textureAtlas.textureNamed(type+"9"),
                                        textureAtlas.textureNamed(type+"10")]
        
        let horseRun = SKAction.animate(with: horseFrames, timePerFrame: 0.09)
        animation = SKAction.repeatForever(horseRun)
    }
    
    //function for defining path
    func path(T1: TimeInterval, T2: TimeInterval, T3: TimeInterval, T4: TimeInterval, T5: TimeInterval, Tx: TimeInterval)->SKAction
    {
        let path1A = SKAction.moveBy(x: 500, y: 0, duration: T1)
        let path2A = SKAction.moveBy(x: 100, y: 60, duration: Tx)
        let path1B = SKAction.moveBy(x: 0, y: 125, duration: T2)
        let path2B = SKAction.moveBy(x: -100, y: 60, duration: Tx)
        let path1C = SKAction.moveBy(x: -500, y: 0, duration: T3)
        let path2C = SKAction.moveBy(x: -100, y: -60, duration: Tx)
        let path1D = SKAction.moveBy(x: 0, y: -150, duration: T4)
        let path2D = SKAction.moveBy(x: 150, y: -60, duration: Tx)
        let path1E = SKAction.moveBy(x: 50, y: 0, duration: T5)
        
        let flip = SKAction.scaleY(to: -1, duration: 0)
        let rotate1 = SKAction.rotate(byAngle: 45, duration: 0)
        let flipBack = SKAction.scaleY(to:1, duration: 0)
        let rotate2 = SKAction.rotate(byAngle: -45, duration: 0)
        let flipLeft = SKAction.scaleX(to: -1, duration: 0)
        let rotate3 = SKAction.rotate(byAngle: -30, duration: 0)
        let flipRight = SKAction.scaleX(to: 1, duration: 0)
        let rotate4 = SKAction.rotate(byAngle: 30, duration: 0)
        let stop = SKAction.run { self.removeAllActions() }
        
        return SKAction.sequence([path1A,path2A,flip,rotate1,
                                  path1B,flipBack,rotate2,flipLeft,path2B,
                                  path1C,path2C,flip,rotate3,
                                  path1D,flipBack,flipRight,rotate4,path2D,
                                  path1E,stop])
    }
    
    //function for making the horse race around the track
    func horseRace(T1: TimeInterval, T2: TimeInterval, T3: TimeInterval, T4: TimeInterval, T5: TimeInterval, Tx: TimeInterval, T: String)
    {
        runningAnimation(type: T)
        self.run(animation)
        
        if let dotEmitter = SKEmitterNode(fileNamed: "Path") {
            // Position the horse in front of objects:
            self.zPosition = 10
            // Place the particle zPosition behind the horse:
            dotEmitter.particleZPosition = -1
            // By adding the emitter node to the player, the emitter moves
            // with the horse and emits new smoke wherever the horse is
            self.addChild(dotEmitter)
            // However, the particles themselves should target the scene,
            // so they trail behind as the horse moves forward.
            dotEmitter.targetNode = self
        }
        
        self.run(path(T1: T1, T2: T2, T3: T3, T4: T4, T5: T5, Tx: Tx))
    }
    
    //function to check if the horse has actions
    func check() -> Bool
    {
        if (self.hasActions())
        {
            return true
        }
        else
        {
            return false
        }
    }
}
