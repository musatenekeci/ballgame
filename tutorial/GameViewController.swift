//
//  GameViewController.swift
//  tutorial
//
//  Created by Musa Tenekeci on 17.11.2022.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
             let scene = GameScene(size: view.bounds.size)
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.physicsBody = SKPhysicsBody(edgeLoopFrom: scene.frame)
                // Present the scene
                view.presentScene(scene)
        
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = false;
        }
    }

     
}
