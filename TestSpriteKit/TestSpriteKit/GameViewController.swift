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
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "SceneTest1") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
                if scene is SceneTest1 {
                    scene1 = scene as? SceneTest1
                }
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
//        let button = GameViewController.createSimpleButton(CGPoint(x:100, y:100), title: "button1", tagId: 100)
//        
//        // タッチ時に呼ばれるメソッドを登録
//        button.addTarget(self, action: #selector(self.tappedButton(_:)), for:.touchUpInside)
//        // 親viewに追加
//        self.view.addSubview(button)
    }
    
    
    @IBAction func test1Clicked(_ sender: Any) {
        scene1!.test1()
    }
    
    @IBAction func test2Clicked(_ sender: Any) {
        scene1!.test2()
    }
    
    @IBAction func test3Clicked(_ sender: Any) {
        scene1!.test3()
    }
    
    @IBAction func test4Clicked(_ sender: Any) {
        scene1!.test4()
    }
    
    @IBAction func test5Clicked(_ sender: Any) {
        scene1!.test5()
    }
    
    @IBAction func test6Clicked(_ sender: Any) {
        scene1!.test6()
    }
    
    @IBAction func test7Clicked(_ sender: Any) {
        scene1!.test7()
    }
    
    @IBAction func test8Clicked(_ sender: Any) {
        scene1!.test8()
    }
    
    @IBAction func test9Clicked(_ sender: Any) {
        scene1!.test9()
    }
    
    @IBAction func test10Clicked(_ sender: Any) {
        scene1!.test10()
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
