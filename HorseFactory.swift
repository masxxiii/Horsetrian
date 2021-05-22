//
//  HorseFactory.swift
//  Horse Racing
//
//  Created by Masood Zafar on 13.05.2021.
//

import SpriteKit

class HorseFactory {
   
    enum HorseType {
        
        case red
        case green
        case blue
        
    }
    
    func create(_ type: HorseType)->Animal
    {
        switch type {
        
        case .red:
        return Horse(horseType: "Red")
        
        case .green:
        return Horse(horseType: "Green")
        
        case .blue:
        return Horse(horseType: "Blue")
        
        }
    }
}
