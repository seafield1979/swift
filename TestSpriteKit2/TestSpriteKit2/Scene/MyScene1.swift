//
//  MyScene1.swift
//  TestSpriteKit2
//
//  Created by Shusuke Unno on 2017/08/09.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//


import SpriteKit
import GameplayKit

class MyScene1: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if self.childNode(withName: "//helloLabel") != nil {
            // シーン遷移
            let scene = GameScene(fileNamed: "GameScene")
            if let _scene = scene {
                //トランジションを作成する。
                let transition = SKTransition.fade(withDuration: 2.0)
                
                self.view!.presentScene(_scene, transition:transition)
            }
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
            }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
