//
//  Animal.swift
//  Horse Racing
//
//  Created by Masood Zafar on 13.05.2021.
//

import SpriteKit

protocol Animal {
    
    var textureAtlas: SKTextureAtlas
    {
        get set
    }
    
    var initialSize: CGSize
    {
        get set
    }
    
    var position: CGPoint
    {
        get set
    }
    
    var animation: SKAction
    {
        get set
    }
    
    func horseRace(T1: TimeInterval, T2: TimeInterval, T3: TimeInterval, T4: TimeInterval, T5: TimeInterval, Tx: TimeInterval, T: String)
    
    func check() -> Bool
    
}
