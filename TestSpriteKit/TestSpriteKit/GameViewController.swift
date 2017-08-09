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
    var skView : SKView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'SceneTest1'
            if let scene = SKScene(fileNamed: "SceneTest1") {
                // Present the scene
                view.presentScene(scene)
                
                if scene is SceneTest1 {
                    scene1 = scene as? SceneTest1
                    skView = scene1!.view
                }
            }
            
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

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
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
