//
//  GameSprite.swift
//  Horse Racing
//
//  Created by Masood Zafar on 12.04.2021.
//

import SpriteKit

protocol GameSprite {
    
    var textureAtlas: SKTextureAtlas
    {
        get set
    }
    
    var initialSize: CGSize
    {
        get set
    }
    
    var runAnimation: SKAction
    {
        get set
    }
    
}
