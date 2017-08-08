//
//  IconNode.swift
//  TestSpriteKit
//      いくつかのSKNodeを持つアイコン
//      １つのオブジェクトで複数のノードを管理するサンプル
//  Created by Shusuke Unno on 2017/08/08.
//  Copyright © 2017年 Sun Sun Soft. All rights reserved.
//

import SpriteKit
import GameplayKit

public class IconNode {
    
    var basePos : CGPoint
    
    var parentNode : SKNode
    var spriteNode : SKSpriteNode? = nil
    var labelNode : SKLabelNode? = nil
    var shapeNode : SKShapeNode? = nil
    
    init(imageName: String, title : String, pos: CGPoint) {
        basePos = pos
        
        // 親ノード
        parentNode = SKNode()
        parentNode.position = basePos
        
        let w : CGFloat = 200.0
        // Shape
        shapeNode = SKShapeNode(rect: CGRect(x:-w/2,y:-w/2,width: w, height: w), cornerRadius: 10.0)
        shapeNode!.fillColor = UIColor.red
        shapeNode!.lineWidth = 3.0
        shapeNode!.position = CGPoint(x: 0, y: 0)
        
        parentNode.addChild(shapeNode!)
        
        //イメージ
        spriteNode = SKSpriteNode(imageNamed: imageName)
        spriteNode!.position = CGPoint(x: 0, y: 0)
        spriteNode!.size = CGSize(width: w - 30, height: w - 30)
        
        parentNode.addChild(spriteNode!)
        
        // ラベル
        labelNode = SKLabelNode(text: "hello world")
        labelNode!.fontColor = SKColor.white
        labelNode!.fontSize = 100.0
        labelNode!.position = CGPoint(x:0, y:-100.0)
        
        parentNode.addChild(labelNode!)
        
    }
}

