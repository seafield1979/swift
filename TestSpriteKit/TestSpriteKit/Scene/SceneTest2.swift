//
//  SceneTest2.swift
//  TestSpriteKit
//
//  Created by Shusuke Unno on 2017/08/09.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//
import SpriteKit
import GameplayKit


class SceneTest2: SKScene {
    
    override func didMove(to view: SKView) {
        
        print("SceneTest2 didMove()")
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        print("touchDown")
        if self.childNode(withName: "//button1") != nil {
            // 元のシーンに戻る
            let scene = SceneTest1(fileNamed: "SceneTest1")
            if let _scene = scene {
                //トランジションを作成する。
                let transition = SKTransition.fade(withDuration: 1.0)
                
                self.view!.presentScene(_scene, transition:transition)
            }

        }
    }
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
//        print("update")
    }
}
