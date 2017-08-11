//
//  GameViewController.swift
//  TestSpriteKit
//
//  Created by Shusuke Unno on 2017/08/08.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var scene1 : SceneTest1? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'SceneTest1'
            let scene = SKScene(fileNamed: "SceneTest1")
//            let scene = SceneTest3(size: self.view.frame.size)

            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    // タッチ時の処理
    func tappedButton(_ sender: AnyObject) {
        switch sender.tag {
        case 100:
            break
        default:
            break
        }
    }
    
    // ボタンを作成
    public static func createSimpleButton(_ pos: CGPoint, title: String, tagId : Int )
        -> UIButton
    {
        let button = UIButton(frame: CGRect(x:pos.x, y:pos.y, width:100.0, height: 50.0))
        
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.setTitleColor(UIColor.white, for: UIControlState.highlighted)
        button.showsTouchWhenHighlighted = true
        
        return button
    }
}
