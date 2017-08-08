//
//  SceneTest1.swift
//  TestSpriteKit
//
//  Created by Shusuke Unno on 2017/08/08.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import SpriteKit
import GameplayKit

enum TestMode {
    case Test1
    case Test2
    case Test3
    case Test4
    case Test5
    case Test6
    case Test7
    case Test8
    case Test9
    case Test10
}

class SceneTest1: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var imageNode : SKSpriteNode?
    private var labelNode : SKLabelNode?
    private var shapeNode : SKShapeNode?
    
    private var movingNode : MovingNode?
    private var movingNodes : [MovingNode] = []
    
    private let MaxNodes = 200
    private var testMode : TestMode = .Test1
    
    
    // シーンが最初に表示される前に呼ばれる
    // Called immediately after a scene is presented by a view.
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//label1") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Shape
        shapeNode = SKShapeNode(rect: CGRect(x:-50,y:-50,width:100,height:100), cornerRadius: 10.0)
        shapeNode!.fillColor = UIColor.red
        shapeNode!.lineWidth = 3.0
        
        movingNode = MovingNode(rect: CGRect(x:-50,y:-50,width:100,height:100), cornerRadius: 10.0)
        movingNode!.fillColor = UIColor.green
        
        // 回転
        shapeNode!.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
        
        //イメージ
        imageNode = SKSpriteNode(imageNamed:"ume")
        imageNode!.position = CGPoint(x:200, y:0)
        // 回転
        imageNode!.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
        
        // ラベル
        labelNode = SKLabelNode(text: "hello world")
        labelNode?.fontColor = SKColor.red
        labelNode!.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
        if let n = self.labelNode?.copy() as! SKLabelNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//        
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//    
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//    
    
    override func update(_ currentTime: TimeInterval) {
        
        switch testMode {
        case .Test1:
            update1(currentTime)
            break
        case .Test2:
            update2(currentTime)
            break
        case .Test3:
            update3(currentTime)
            break
            
        case .Test4:
            update4(currentTime)
            break
            
        case .Test5:
            update5(currentTime)
            break
            
        case .Test6:
            update6(currentTime)
        
        case .Test7:
            update7(currentTime)
        
        case .Test8:
            update8(currentTime)
        
        case .Test9:
            update9(currentTime)
        
        case .Test10:
            update10(currentTime)
            
        }
    }
    
    /*
      各テストモードのupdate処理
     */
    func update1(_ currentTime: TimeInterval) {
        
    }
    
    func update2(_ currentTime: TimeInterval) {
        
    }
    func update3(_ currentTime: TimeInterval) {
        
    }
    func update4(_ currentTime: TimeInterval) {
        for n in movingNodes {
            n.move()
        }
    }
    func update5(_ currentTime: TimeInterval) {
        
    }
    
    func update6(_ currentTime: TimeInterval) {
        
    }
    
    func update7(_ currentTime: TimeInterval) {
        
    }
    
    func update8(_ currentTime: TimeInterval) {
        
    }
    
    func update9(_ currentTime: TimeInterval) {
        
    }
    
    func update10(_ currentTime: TimeInterval) {
        
    }
    
    // スクリーン座標のランダムな位置を取得する
    func randomPos() -> CGPoint {
        let pos = CGPoint(x: CGFloat(arc4random() % UInt32(self.size.width) / 2),
                          y: CGFloat(arc4random() % UInt32(self.size.height)) / 2)
        return self.convertPoint(fromView: pos)
    }
    
    func randomColor() -> SKColor {
        return SKColor.init(red: CGFloat(arc4random() % 101) / 100.0,
                            green: CGFloat(arc4random() % 101) / 100.0,
                            blue: CGFloat(arc4random() % 101) / 100.0, alpha: 1.0)
    }
    
    // 大量のShapeNodeを表示
    func test1() {
        testMode = .Test1
        
        // 全ノード削除
        self.removeAllChildren()
        
        for _ in 0..<MaxNodes {
            if let n = self.shapeNode?.copy() as! SKShapeNode? {
                n.position = randomPos()
                n.fillColor = randomColor()
                self.addChild(n)
            }
        }
    }
    
    // スプライトを大量表示
    func test2() {
        testMode = .Test2
        // 全ノード削除
        self.removeAllChildren()
        
        for _ in 0..<MaxNodes {
            if let n = self.imageNode?.copy() as! SKSpriteNode? {
                n.position = randomPos()
                self.addChild(n)
            }
            
        }
    }
    
    // ラベルを大量表示
    func test3() {
        testMode = .Test3
        // 全ノード削除
        self.removeAllChildren()
        
        for _ in 0..<MaxNodes {
            if let n = self.labelNode?.copy() as! SKLabelNode? {
                n.position = randomPos()
                n.fontColor = randomColor()
                self.addChild(n)
            }
            
        }
    }
    
    // ノードの移動
    func test4() {
        testMode = .Test4
        
        movingNodes.removeAll()
        self.removeAllChildren()
        
        for _ in 0..<20 {
            if let n = self.movingNode?.copy() as! MovingNode? {
                n.position = CGPoint(x:0, y:0)
                
                // 移動速度
                n.movingSpeed.x = CGFloat( Int(arc4random() % 10) - 5)
                n.movingSpeed.y = CGFloat( Int(arc4random() % 10) - 5)
                
                // 折り返しの座標
                n.minPos.x = self.size.width / 2 * (-1)
                n.minPos.y = self.size.height / 2 * (-1)
                n.maxPos.x = self.size.width / 2
                n.maxPos.y = self.size.height / 2
                
                n.fillColor = randomColor()
                
                self.addChild(n)
                movingNodes.append(n)
            }
        }
    }
    
    // 子を持つノードを作成
    func test5() {
        testMode = .Test5
        self.removeAllChildren()
        
        let n = IconNode(imageName: "ume", title: "hoge", pos: CGPoint(x:0, y:0))
        
        self.addChild(n.parentNode)
    }
    
    // 描画プライオリティを設定する
    // .zPositionで描画優先順を設定できる
    // .zPosition は値が小さいほど先に表示される（奥に表示される)
    func test6() {
        testMode = .Test6
        self.removeAllChildren()
        
        // プライオリティを設定しない場合は (奥) 赤 > 緑 > 青 (手前)
        // プライオリティを設定した場合は  (奥) 青 > 緑 > 赤 (手前)
        if let n = self.shapeNode?.copy() as! SKShapeNode? {
            n.position = CGPoint(x:0, y:0)
            n.fillColor = .red
//            n.zPosition = 3.0
            self.addChild(n)
        }
        if let n = self.shapeNode?.copy() as! SKShapeNode? {
            n.position = CGPoint(x:50, y:50)
            n.fillColor = .green
//            n.zPosition = 2.0
            self.addChild(n)
        }
        if let n = self.shapeNode?.copy() as! SKShapeNode? {
            n.position = CGPoint(x:100, y:100)
            n.fillColor = .blue
//            n.zPosition = 1.0
            self.addChild(n)
        }
    }
    
    // マスク(クリッピング)のテスト
    func test7() {
        testMode = .Test7
        self.removeAllChildren()
        
        //--------------------
        // crop1
        // 画像
        let imageN = SKSpriteNode(imageNamed:"ume")
        imageN.position = CGPoint(x:0, y:0)
        imageN.size = CGSize(width: 400, height: 400)
        
        // マスク用のノードを作成（矩形)
        let maskNode = SKShapeNode(rect: CGRect(x:-100,y:-100,width:200,height:200), cornerRadius: 10.0)
        maskNode.fillColor = .black
        maskNode.strokeColor = .black
        
        let cropNode = SKCropNode()
        cropNode.maskNode = maskNode
        cropNode.addChild(imageN)       // 重要  CropNodeに描画したいノードを追加する
        
        self.addChild(cropNode)
        
        //------------------------------
        // crop2
        // 画像
        let imageN2 = SKSpriteNode(imageNamed:"ume")
        imageN2.position = CGPoint(x:0, y:0)
        imageN2.size = CGSize(width: 400, height: 400)

        // マスク用のノードを作成(円形)
        let maskNode2 = SKShapeNode(circleOfRadius: 100.0)
        maskNode2.fillColor = .black
        maskNode2.strokeColor = .black
        
        let cropNode2 = SKCropNode()
        cropNode2.maskNode = maskNode2
        cropNode2.addChild(imageN2)       // 重要  CropNodeに描画したいノードを追加する
        cropNode2.position = CGPoint(x: 0, y: 300)
        
        
        self.addChild(cropNode2)
        
    }
    
    func test8() {
        testMode = .Test8
        self.removeAllChildren()
    }
    
    func test9() {
        testMode = .Test9
        self.removeAllChildren()
    }
    
    func test10() {
        testMode = .Test10
        self.removeAllChildren()
    }
}
