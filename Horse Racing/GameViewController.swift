//
//  GameViewController.swift
//  Horse Racing
//
//  Created by Masood Zafar on 18.03.2021.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        //configuring
        if let view = self.view as! SKView?
        {
            let size = UIScreen.main.bounds.size
            let menuScene = MenuScene(size: size)
            
            //let scene = GameScene(size: size)
            
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            menuScene.scaleMode = .aspectFill
            // size our scene to fit the view exactly:
            menuScene.size = view.bounds.size
            // Show the new scene:
            skView.presentScene(menuScene)
            
        }
        
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.landscape.rawValue);
       }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
