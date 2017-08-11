//
//  SceneTest3.swift
//  TestSpriteKit
//      アクション(アニメーション)のテスト
//  Created by Shusuke Unno on 2017/08/10.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//
import SpriteKit
import GameplayKit


class SceneTest3: SKScene {
    private var testMode : TestMode = .Test1
    private var testNodes : [SKNode] = []
    private var shapeNode : SKShapeNode? = nil
    
    override init(size : CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        // アクションを行うノードを追加
        let n = SKShapeNode(rect: CGRect(x: -50, y: -50, width: 100, height: 100))
        n.position = self.convertPoint(fromView: CGPoint(x:200, y:200))
        n.fillColor = .white
        self.shapeNode = n
        self.addTestNode(n)
        
        // テスト用のボタンを追加
        var y : CGFloat = 50.0
        for i in 1...10 {
            let name = "test" + i.description
            let pos = self.convertPoint(fromView: CGPoint(x:50, y:y))
            _ = addButton(name: name, pos: pos)
            y += 30.0
        }
    }
    
    // MARK: Funcs

    // ボタンを追加する
    func addButton(name : String, pos : CGPoint) -> SKLabelNode {
        let n = SKLabelNode(text: name)
        n.name = name
        n.fontSize = 20
        n.fontColor = .white
        n.fontName = "HiraKakuProN-W6"
        n.position = pos
        
        addChild(n)
        
        return n
    }
    
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
            case "test1":
                test1_2()
                break
            case "test2":
                test2()
                break
            case "test3":
                test3()
                break
            case "test4":
                test4()
                break
            case "test5":
                test5()
                break
            case "test6":
                test6()
                break
            case "test7":
                test7()
                break
            case "test8":
                test8()
                break
            case "test9":
                test9()
                break
            case "test10":
                test10()
            default:
                break
            }
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
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
    
    // MARK: Test
    
    // ノードを移動する
    func test1() {
        testMode = .Test1
        
        // 今の座標から移動
        let action = SKAction.moveBy(x: 0, y:100, duration: 1.0)
        
        // 指定の座標に移動
        let action2 = SKAction.move(to: self.convertPoint(fromView:CGPoint(x:200, y:400)), duration: 1.0)
        
        // パスに沿って移動
        let path = CGMutablePath()
        path.move(to: CGPoint(x:0, y: 0))
        path.addLine(to: CGPoint(x:50,y:0))
        path.addLine(to: CGPoint(x:50,y:50))
        path.addLine(to: CGPoint(x:0,y:50))
        path.addLine(to: CGPoint(x:0,y:0))
        let action3 = SKAction.follow(path, asOffset: true, orientToPath: false, duration: 3.0)
        
        self.shapeNode!.run(action3, completion: {() -> Void in
            print("test1 completion")
        })
    }
    
    // 移動と停止を繰り返す
    func test1_2() {
        // 今の座標から移動
        let move1 = SKAction.moveBy(x: 0, y:100, duration: 1.0)
        let move2 = SKAction.moveBy(x: 100, y:0, duration: 1.0)
        let move3 = SKAction.moveBy(x: 0, y:-100, duration: 1.0)
        let move4 = SKAction.moveBy(x: -100, y:0, duration: 1.0)
        let wait1 = SKAction.wait(forDuration: 0.5)
        
        self.shapeNode!.run( SKAction.sequence(
            [
                move1,
                wait1,
                move2,
                wait1,
                move3,
                wait1,
                move4,
                wait1
            ]
        ))

    }
    
    // サイズ変更
    func test2() {
        testMode = .Test2
        
        let action = SKAction.scale(to: 2.0, duration: 1.0)
        let action2 = SKAction.scale(to: 0.5, duration: 1.0)

//        self.shapeNode!.run(action, completion: {() -> Void in
//            print("test2 completion")
//        })
        
        self.shapeNode!.run( SKAction.sequence(
            [
                action,
                action2,
                ]
        ))
    }
    
    // 半透明
    func test3() {
        testMode = .Test3
        
        let action = SKAction.fadeAlpha(to: 0, duration: 1.0)
        let action2 = SKAction.fadeAlpha(to: 1.0, duration: 1.0)
        
        self.shapeNode!.run( SKAction.sequence(
            [
                action,
                action2,
                ]
        ))
    }
    // アクションの実行
    func test4() {
        testMode = .Test4
        
        let mode = 5
        
        switch mode {
        case 1:
            // １つのアクションを１回だけ実行
            let action = SKAction.fadeAlpha(to: 0, duration: 1.0)
            self.shapeNode!.run(action, completion: {() -> Void in
                print("test4 mode1 completion")
            })
        case 2:
            // １つのアクションを繰り返し実行
            let action = SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1.0)
            let action2 = SKAction.repeatForever(action)
            self.shapeNode!.run(action2, completion: {() -> Void in
                print("test4 mode2 completion")
            })
            
        case 3:
            // １つのアクションを指定回数繰り返し
            let action = SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1.0)
            let action2 = SKAction.repeat(action, count: 3)
            self.shapeNode!.run(action2, completion: {() -> Void in
                print("test4 mode3 completion")
            })
            break
        case 4:
            // 複数のアクションを連続で実行
            let action = SKAction.scale(to: 2.0, duration: 1.0)
            let action2 = SKAction.scale(to: 0.5, duration: 1.0)
            self.shapeNode!.run( SKAction.sequence([action, action2]), completion: {() -> Void in
                    print("test4 mode4 completion")
            })
        case 5:
            // 複数のアクションを並列で実行
            let action = SKAction.scale(to: 2.0, duration: 1.0)
            let action2 = SKAction.fadeAlpha(to: 0, duration: 1.0)
            self.shapeNode!.run( SKAction.group([action, action2]))
            
        default:
            break
        }
        
        //
    }
    
    // アクションの動作タイミング
    func test5() {
        testMode = .Test5
        
//        SKActionTimingLinear アクションは一定の速度で実行される
//        SKActionTimingEaseIn ゆっくり始まり、スピードアップする
//        SKActionTimingEaseOut 最初速く始まり、スピードダウンする
//        SKActionTimingEaseInEaseOut 最初ゆっくり、中間で速度が速まり、最後ゆっくり終わる

        let mode = 4

        let action = SKAction.moveBy(x: 0, y:400, duration: 3.0)
        
        // 座標を戻す
        self.shapeNode!.position = self.convertPoint(fromView:CGPoint(x:200, y:400))
        
        switch mode {
        case 1:
            // 等速
            action.timingMode = .linear
        case 2:
            // 徐々に速くなる
            action.timingMode = .easeIn
        case 3:
            // 徐々に遅くなる
            action.timingMode = .easeOut
        case 4:
            // ゆっくり ~ 速い ~ ゆっくり
            action.timingMode = .easeInEaseOut
        }
        
        self.shapeNode!.run(action, completion: {() -> Void in
            
        })

    }
    
    // 回転
    func test6() {
        testMode = .Test6
        
        // 時計回り 360度回転
        let action = SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1.0)
        
        // 反時計回り 360度回転
        let action2 = SKAction.reversed(action)()
        
        self.shapeNode!.run( SKAction.sequence([
            action,
            action2
            ]),
                             completion: {() -> Void in
            print("test6 completion")
        }
        )
    }
    
    // 大量のShapeNodeを表示
    func test7() {
        testMode = .Test7
        
    }
    
    func test8() {
        testMode = .Test8
        
    }
    
    func test9() {
        testMode = .Test9
        
    }
    
    func test10() {
        testMode = .Test10
        
    }
}
