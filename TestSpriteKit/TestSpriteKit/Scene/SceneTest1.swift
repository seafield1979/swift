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
    
    private let MaxNodes = 10
    private var testMode : TestMode = .Test1
    private var testNodes : [SKNode] = []
    
    // シーンが最初に表示される前に呼ばれる
    // Called immediately after a scene is presented by a view.
    override func didMove(to view: SKView) {
        
        // Shape
        shapeNode = SKShapeNode(rect: CGRect(x:-50,y:-50,width:100,height:100), cornerRadius: 10.0)
        shapeNode!.fillColor = UIColor.red
        shapeNode!.lineWidth = 3.0
        
        movingNode = MovingNode(rect: CGRect(x:-50,y:-50,width:100,height:100), cornerRadius: 10.0)
        movingNode!.fillColor = UIColor.green
        
//        // 回転
//        shapeNode!.run(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 3.0),
//                       completion: {() -> Void in
//                        print("complete")
//                        print("complete2")
//                        print("complete3")
//        }
//        )
//        shapeNode!.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
        
        //イメージ
        imageNode = SKSpriteNode(imageNamed:"ume")
        imageNode!.position = CGPoint(x:200, y:0)
        // 回転
        imageNode!.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
        
        // ラベル
        labelNode = SKLabelNode(text: "hello world")
        labelNode?.fontColor = SKColor.white
        labelNode!.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
        
        for i in 1...10 {
            let name = String(format: "test%dButton", i)
            if let n = self.childNode(withName: name) {
                n.zPosition = 100
            }
        }
    }
    
    // MARK: Funcs
    
    // スクリーン座標のランダムな位置を取得する
    func randomPos() -> CGPoint {
        let pos = CGPoint(x: CGFloat(arc4random() % UInt32(self.size.width)),
                          y: CGFloat(arc4random() % UInt32(self.size.height)))
        return self.convertPoint(fromView: pos)
    }
    
    func randomColor() -> SKColor {
        return SKColor.init(red: CGFloat(arc4random() % 101) / 100.0,
                            green: CGFloat(arc4random() % 101) / 100.0,
                            blue: CGFloat(arc4random() % 101) / 100.0, alpha: 1.0)
    }
    
    // 各テストモードで使用したノードを削除
    func removeTestNodes() {
        self.removeChildren(in: testNodes)
    }
    
    // テスト用のノードを追加
    // 後から削除できるようにリストに追加する
    func addTestNode(_ node: SKNode) {
        self.addChild(node)
        testNodes.append(node)
    }
    
    // MARK: Touches
    func touchDown(atPoint pos : CGPoint, touch : UITouch) {
        
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name {
            print(name)
            switch name {
            case "test1Button":
                test1()
                break
            case "test2Button":
                test2()
                break
            case "test3Button":
                test3()
                break
            case "test4Button":
                test4()
                break
            case "test5Button":
                test5()
                break
            case "test6Button":
                test6()
                break
            case "test7Button":
                test7()
                break
            case "test8Button":
                test8()
                break
            case "test9Button":
                test9()
                break
            case "test10Button":
                test10()
            default:
                break
            }
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchDown(atPoint: t.location(in: self), touch: t)
        }
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
    
    
    // MARK: Updates
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
    
    // MARK: Tests
    
    // 大量のShapeNodeを表示
    func test1() {
        testMode = .Test1
        
        // 全ノード削除
        removeTestNodes()
        
        for i in 0..<MaxNodes {
            if let n = self.shapeNode?.copy() as! SKShapeNode? {
                n.position = randomPos()
                n.fillColor = randomColor()
                n.zPosition = 10.0
                n.name = "test1_" + i.description
                
                // 回転
                n.run(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 3.0),
                               completion: {() -> Void in
                                print("complete")
                }
                )

                self.addTestNode(n)
            }
        }
    }
    
    // スプライトを大量表示
    func test2() {
        testMode = .Test2
        // 全ノード削除
        removeTestNodes()

        for _ in 0..<MaxNodes {
            if let n = self.imageNode?.copy() as! SKSpriteNode? {
                n.position = randomPos()
                self.addTestNode(n)
            }
            
        }
    }
    
    // ラベルを大量表示
    func test3() {
        testMode = .Test3
        // 全ノード削除
        self.removeTestNodes()
        
        for _ in 0..<MaxNodes {
            if let n = self.labelNode?.copy() as! SKLabelNode? {
                n.position = randomPos()
                n.fontColor = randomColor()
                self.addTestNode(n)
            }
            
        }
    }
    
    // ノードの移動
    func test4() {
        testMode = .Test4
        
        movingNodes.removeAll()
        // 全ノード削除
        removeTestNodes()

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
                
                movingNodes.append(n)
                self.addTestNode(n)
            }
        }
    }
    
    // 子を持つノードを作成
    func test5() {
        testMode = .Test5

        // 全ノード削除
        removeTestNodes()

        let n = IconNode(imageName: "ume", title: "hoge", pos: CGPoint(x:0, y:0))
        n.parentNode.zPosition = 10.0
        
        self.addTestNode(n.parentNode)
        
        let n2 = IconNode(imageName: "ume", title: "hoge", pos: CGPoint(x:0, y:0))
        n2.parentNode.zPosition = 11.0
        n2.parentNode.position = CGPoint(x:20, y:20)
        
        self.addTestNode(n2.parentNode)
    }
    
    // 描画プライオリティを設定する
    // .zPositionで描画優先順を設定できる
    // .zPosition は値が小さいほど先に表示される（奥に表示される)
    func test6() {
        testMode = .Test6
        removeTestNodes()
        
        // プライオリティを設定しない場合は (奥) 赤 > 緑 > 青 (手前)
        // プライオリティを設定した場合は  (奥) 青 > 緑 > 赤 (手前)
        if let n = self.shapeNode?.copy() as! SKShapeNode? {
            n.position = CGPoint(x:0, y:0)
            n.fillColor = .red
//            n.zPosition = 3.0
            self.addTestNode(n)
        }
        if let n = self.shapeNode?.copy() as! SKShapeNode? {
            n.position = CGPoint(x:50, y:50)
            n.fillColor = .green
//            n.zPosition = 2.0
            self.addTestNode(n)
        }
        if let n = self.shapeNode?.copy() as! SKShapeNode? {
            n.position = CGPoint(x:100, y:100)
            n.fillColor = .blue
//            n.zPosition = 1.0
            self.addTestNode(n)
        }
    }
    
    // マスク(クリッピング)のテスト
    func test7() {
        testMode = .Test7
        // 全ノード削除
        removeTestNodes()
        
        //--------------------
        // crop1
        // 画像
        let imageN = SKSpriteNode(imageNamed:"ume")
        imageN.position = CGPoint(x:0, y:0)
        imageN.size = CGSize(width: 200, height: 200)
        
        // マスク用のノードを作成（矩形)
        let maskNode = SKShapeNode(rect: CGRect(x:-50,y:-50,width:100,height:100), cornerRadius: 10.0)
        maskNode.fillColor = .black
        maskNode.strokeColor = .black
        
        let cropNode = SKCropNode()
        cropNode.maskNode = maskNode
        cropNode.addChild(imageN)       // 重要  CropNodeに描画したいノードを追加する
        
        self.addTestNode(cropNode)
        
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
        
        self.addTestNode(cropNode2)
    }

    // シーン遷移
    func test8() {
        testMode = .Test8
        // 全ノード削除
        removeTestNodes()

        //スタートボタンを押した場合はプレイ画面に切り替える。
        let scene = SceneTest2(fileNamed: "SceneTest2")
        if let _scene = scene {
            //トランジションを作成する。
            let transition = SKTransition.fade(withDuration: 2.0)

            self.view!.presentScene(_scene, transition:transition)
        }
        
    }
    
    func test9() {
        testMode = .Test9
        // 全ノード削除
        removeTestNodes()
        
        // 画面を覆うNodeを作成
        let w = self.size.width
        let h = self.size.height
//        let n = SKShapeNode(rect: CGRect(x: -w/2, y: -h/2, width : w, height: h), cornerRadius: 10.0)
        let n = SKShapeNode(rect: CGRect(x: 0, y: 0, width : 200, height: -50), cornerRadius: 10.0)
        n.position = self.convertPoint(fromView: CGPoint(x:0, y:0))
        
        self.addTestNode(n)
    }
    
    func test10() {
        testMode = .Test10
        // 全ノード削除
        removeTestNodes()
        
        var pos = CGPoint(x: 150, y:50)
        
        // 四角形
        var pos2 = self.convertPoint(fromView: pos)
        let n1 = SKShapeNode(rect: CGRect(x:pos2.x, y:pos2.y, width: 50, height: 50))
        n1.fillColor = .white
        n1.strokeColor = .red
        n1.lineWidth = 2.0
        self.addTestNode(n1)
        
        pos.y += 50
        pos2 = self.convertPoint(fromView: pos)
        
        // 三角形
        // 1辺の大きさ.
        let length: CGFloat = 30
        
        // 始点から終点までの４点を指定.
        let p2 = pos2

        let rad = CGFloat.pi / 180
        var points = [CGPoint(x:p2.x + cos(-30 * rad) * length, y: p2.y + sin(-30 * rad) * length),
                      CGPoint(x:p2.x + cos(90 * rad)  * length, y: p2.y + sin(90 * rad) * length),
                      CGPoint(x: p2.x + cos(210 * rad) * length, y: p2.y + sin(210 * rad) * length),
                      CGPoint(x: p2.x + cos(-30 * rad) * length, y: p2.y + sin(-30 * rad) * length)]
        let n2 = SKShapeNode(points: &points, count: points.count)
        n2.fillColor = .white
        n2.strokeColor = .red
        n2.lineWidth = 2.0
        self.addTestNode(n2)
        
        pos.y += 60
        pos2 = self.convertPoint(fromView: pos)
        
        // 円形
        let n3 = SKShapeNode(circleOfRadius: 30.0)
        n3.fillColor = .white
        n3.strokeColor = .red
        n3.lineWidth = 2.0
        n3.position = pos2
        self.addTestNode(n3)

        pos.y += 60
        pos2 = self.convertPoint(fromView: pos)
        
        // 線
        let p4 = pos2
        var points2 = [CGPoint(x:p4.x, y: p4.y),
                      CGPoint(x:p4.x + 50.0, y: p4.y)]
        let n4 = SKShapeNode(points: &points2, count: points2.count)
        n4.strokeColor = .red
        n4.lineWidth = 2.0
        self.addTestNode(n4)
        
        pos.y += 60
        pos2 = self.convertPoint(fromView: pos)
        
        // ラベル
        let n5 = SKLabelNode(text: "hello world")
        n5.fontColor = SKColor.red
        n5.position = pos2
        n5.fontName = "HiraKakuProN-W6"
        self.addTestNode(n5)
        
        // スプライト
        pos.y += 60
        pos2 = self.convertPoint(fromView: pos)
        let n6 = SKSpriteNode(imageNamed:"ume")
        n6.position = pos2
        n6.size = CGSize(width: 100, height: 100)
        self.addTestNode(n6)
    }
    
    // MARK: SKButtonDelegate
    
    func skButtonClicked() {
        print("hello")
    }
}
